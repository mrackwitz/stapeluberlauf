module StackExchange
  class Request
    module Behavior
      module Acceptable
        # Casts an accept vote.
        #
        # @note auth required
        #
        # @return [Request]
        #
        def accept
          sub('accept').auth_required!
        end
        
        # Undoes an accept vote.
        #
        # @note auth required
        #
        # @return [Request]
        #
        def undo_accept
          sub('accept/undo').auth_required!
        end
      end
    end
  end
end
