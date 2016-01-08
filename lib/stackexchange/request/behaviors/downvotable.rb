module StackExchange
  class Request
    module Behavior
      module Downvotable
        # Casts a downvote on the given resource.
        #
        # @note auth required
        #
        # @return [Request]
        #
        def downvote
          request('downvote').auth_required!
        end

        # Undoes a downvote on the given resource
        #
        # @note auth required
        #
        # @return [Request]
        #
        def undo_downvote
          request('downvote/undo').auth_required!
        end
      end
    end
  end
end
