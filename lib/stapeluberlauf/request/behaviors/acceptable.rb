module Stapeluberlauf
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
          request('accept').auth_required!
        end
        
        # Undoes an accept vote.
        #
        # @note auth required
        #
        # @return [Request]
        #
        def undo_accept
          request('accept/undo').auth_required!
        end
      end
    end
  end
end
