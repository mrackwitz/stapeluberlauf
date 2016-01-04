module StackExchange
  class Request
    module Behavior
      module Commentable
        # Get the comments.
        #
        # @return [Request]
        #
        def comments
          sub('comments')
        end
      end
    end
  end
end
