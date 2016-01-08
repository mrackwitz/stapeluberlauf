module StackExchange
  class Request
    module Behavior
      module Flagable
        # Casts a flag on the given resource.
        #
        # @note auth required
        #
        # @return [Request]
        #
        def add_flag
          request('flags/add').auth_required!
        end
        
        # Returns valid flag options for the given resource.
        #
        # @note auth required
        #
        # @return [Request]
        #
        def flag_options
          request('flags/options').auth_required!
        end
      end
    end
  end
end
