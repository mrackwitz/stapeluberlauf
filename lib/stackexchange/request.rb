require 'json'
require 'date'

require 'stackexchange/authorizable.rb'

module StackExchange
  class Request
    autoload :Answer,   'stackexchange/request/answer'
    autoload :Behavior, 'stackexchange/request/behavior'
    autoload :Comment,  'stackexchange/request/comment'
    autoload :Question, 'stackexchange/request/question'
    autoload :Site,     'stackexchange/request/site'

    include StackExchange::Authorizable
    
    # @return [Int] the maxium number of items on a page
    MAX_PAGE_SIZE = 100.freeze
    
    # @return [Net::HTTP] a HTTP client
    attr_accessor :client

    # @return [String] the path of the endpoint
    attr_accessor :endpoint

    # @return [Hash<Symbol, String>] the parameter
    attr_accessor :params

    # @return [Site] the site
    attr_accessor :site

    # @return [Int] the specific page to fetch, starts at and defaults to 1
    attr_accessor :page

    # @return [Int] any value between 0 and 100, defaults to 30 on API-site,
    #               initialized by default to 100
    attr_accessor :page_size

    # Initialize a new instance
    #
    # @param [Net::HTTP] client  @see #client
    #
    # @param [Site] site  @see #site
    #
    # @param [String] endpoint  @see #endpoint
    #
    # @param [Hash<Symbol, String>] params  @see #params
    #
    def initialize(client=nil, site=nil, endpoint='', params={})
      @client = client
      @site = site
      @endpoint = endpoint
      @params = params
      @page = 1
      @page_size = MAX_PAGE_SIZE
    end
    
    # Create a new request based on another instance.
    #
    # @param [Request] request
    #   takes over all values from the given request
    #
    def self.based_on(base_request)
      new.tap do |instance|
        base_request.instance_variables.each do |var|
          value = base_request.instance_variable_get(var)
          method_sym = "#{var.to_s[1..-1]}="
          instance.send(method_sym, value.is_a?(Fixnum) ? value : value.dup)
        end
      end
    end
    
    # Request for filtered results by given parameters.
    #
    # @param [#to_time] from
    #   Define a lower limit for the range of `creation_date`.
    #
    # @param [#to_time] to
    #   Define an upper limit for the range of `creation_date`.
    #
    # @param [String] min
    #   Define a lower limit for the range of the sort criteria.
    #
    # @param [String] max
    #   Define an upper lmit for the range of the sort criteria.
    #
    # @return [Request] returns the receiver to support a floating API
    #
    def filter(from: nil, to: nil, min: nil, max: nil)
      @params.merge!({
        fromdate: from != nil ? from.to_time.to_i : nil,
        todate:   to   != nil ? to.to_time.to_i   : nil,
        min:      min,
        max:      max,
      })
      self
    end
    
    # Request for sorted results by a sort criteria.
    #
    # Calling this method multiple times on the same request instance
    # will not add a further level of sorting, but override the previous
    # defined sort order.
    #
    # @param [Symbol] sort_by  the sort order
    #   Valid for posts (questions, answers) and comments:
    #   - :creation: creation_date
    #   - :votes:    score
    #
    #   Valid for posts (questions, answers):
    #   - :activity: last_activity_date
    #
    #   Valid for questions (without prefilter as e.g. featured, unanswered, etc.):
    #   - :hot:      by the formula ordering the hot tab
    #   - :week:     by the formula ordering the week tab
    #   - :month:    by the formula ordering the month tab
    #
    #   Valid for badges:
    #   - :rank:     by rank (default)
    #   - :name:     by name
    #   - :type:     by type
    #
    # @return [Request] returns the receiver to support a floating API
    #
    def sort_by(sort_by)
      @params[:sort] = sort_by.to_s
      self
    end

    # Execute the request.
    #
    # @return [Result]
    #
    def execute
      if is_auth_required? && !authorized?
        raise "Request to #{self.endpoint} is not authorized, but authentication is required!"
      end
      http_res = client.get(uri)
      json = JSON.parse(http_res.body)
      Response.new.tap do |res|
        json.map do |key, value|
          res.send("#{key}=", value)
        end
      end
    end

    # Allows to paginate
    #
    # @return [Enumerator]
    #
    def pages
      Enumerator.new do |yielder|
        response = self.execute
        yielder << response
        page_request = self.dup
        while response.has_more
          page_request.page += 1
          response = page_request.execute
          yielder << response
        end
      end
    end
    
    protected
    
    # Define that authentication is required for this endpoint. 
    #
    # @return [Result]
    #
    def auth_required!
      @auth_required = true
      self
    end
    
    # Checks whether authentication is required.
    #
    # @return [Bool]
    #
    def is_auth_required?
      @auth_required
    end

    # Create a new request based on the current instance.
    #
    # @param [String] endpoint  @see #endpoint
    #
    # @param [Hash<Symbol, String>] params  @see #params
    #
    def sub(endpoint, params={})
      self.class.based_on(self).tap do |instance|
        instance.endpoint += "/#{endpoint}"
        instance.params.merge! params
      end
    end

    # Create a new request for a collection based on the current instance.
    #
    # @param [Class] request_class  the class of the request, if {ids} is not nil
    #
    # @param [String|Array] ids  one or multiple ids
    #
    # @param [String] endpoint  @see #endpoint
    #
    # @param [Hash<Symbol, String>] params  @see #params
    #
    def sub_collection(request_class, ids, endpoint, params={})
      request_class ||= self.class
      request_class.based_on(self).tap do |instance|
        instance.endpoint += "/#{endpoint}"
        instance.params.merge! params
        unless ids.nil?
          instance.endpoint += "/#{process_ids(ids)}"
        end
      end
    end

    # Serialize a list of ids if necessary
    #
    # @param [String|Array] ids  the ids of one or multiple resources
    #
    # @return [String]
    #
    def process_ids(ids)
      if ids.is_a? Array
        raise "Not more than 100 ids are allowed!" if ids.length > 100
        ids.join(';')
      else
        ids
      end
    end

    # Returns the merged parameter from different attributes
    #
    # @return [Hash<Symbol, String>]
    #
    def merged_params
      params.merge({
        site: site,
        key: key,
        access_token: access_token,
      })
    end
    
    private
    
    # Returns the composed request URI with encoded parameters
    #
    # @return [URI]
    #
    def uri
      uri = BASE_URI.dup
      uri.path += endpoint
      uri.query = URI.encode_www_form(merged_params)
      uri
    end
  end
end
