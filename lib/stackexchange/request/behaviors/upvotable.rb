module StackExchange
  class Request
    module Behavior
      module Upvotable
        # Casts an upvote on the given resource.
        #
        # @note auth required
        #
        # @return [Request]
        #
        def upvote
          request('upvote').auth_required!
        end

        # Undoes an upvote on the given resource
        #
        # @note auth required
        #
        # @return [Request]
        #
        def undo_upvote
          request('upvote/undo').auth_required!
        end
      end
    end
  end
end
