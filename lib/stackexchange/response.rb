module StackExchange
  class Response
    # @return [Int, nil] is only set when the API detects the request took an unusually long time to run.
    # When it is set an application must wait that number of seconds before calling that method again.
    attr_accessor :backoff

    # @return [Int, nil] refers to an error type returned by the API
    attr_accessor :error_id

    # @return [String, nil] message of the error referred by #error_id
    attr_accessor :error_message

    # @return [String, nil] name of the error referred by #error_name
    attr_accessor :error_name

    # @return [Boolean] whether there are more pages
    attr_accessor :has_more

    # @return [Array] an array of the type found in #type
    attr_accessor :items

    # @return [Int, nil] the requested page
    # @note Not included in the `default` filter
    attr_accessor :page

    # @return [Int, nil] the size of the requested page
    # @note Not included in the `default` filter
    attr_accessor :page_size

    # @return [Int] the maximum allowed quota bound to the credentials, if the requested was authorized
    attr_accessor :quota_max

    # @return [Int] the remaining quota bound to the credentials, if the requested was authorized
    attr_accessor :quota_remaining

    # @return [Int, nil] the total number of items
    # @note Not included in the `default` filter
    attr_accessor :total

    # @return [String] the name of the entities returned in #items
    # @note Not included in the `default` filter
    attr_accessor :type
  end
end
