require 'uri'
require 'faraday'

module StackExchange
  require 'stackexchange/version'
  autoload :Error,    'stackexchange/error'
  autoload :Request,  'stackexchange/request'
  autoload :Response, 'stackexchange/response'

  BASE_URI = URI.parse('https://api.stackexchange.com/2.2').freeze

  class << self
    # @return [Net::HTTP|Faraday]
    #
    attr_accessor :default_client

    def default_client
      @default_client ||= Faraday.new(url: BASE_URI.dup) do |builder|
        builder.adapter Faraday.default_adapter
      end
    end
  end

  # Get access to a specific site by its name
  #
  # @param [String] name  @see Site#name
  #
  # @return [Site]
  #
  def self.site(name)
    StackExchange::Request::Site.new(default_client, name)
  end
end
