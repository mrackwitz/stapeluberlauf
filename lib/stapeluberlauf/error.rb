module Stapeluberlauf
  class Error < StandardError
    # @return [Request] the request which resulted in the error
    attr_accessor :request

    # @return [Response] the erroneous response
    attr_accessor :response

    # Initialize a new error from a request and its response
    #
    # @param [Request] request  @see #request
    #
    # @param [Response] response  @see #response
    #
    def initialize(request, response)
      super(response.error_message)
      self.request = request
      self.response = response
    end

    # Refers to an error type returned by the API
    #
    # @return [Int]
    def id
      response.error_id
    end

    # Returns the name of the error
    #
    # @return [String]
    def name
      response.error_name
    end
  end
end
