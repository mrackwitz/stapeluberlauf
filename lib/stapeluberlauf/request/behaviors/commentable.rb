module Stapeluberlauf
  class Request
    module Behavior
      module Commentable
        # Get the comments.
        #
        # @return [Request]
        #
        def comments
          request('comments')
        end
      end
    end
  end
end
