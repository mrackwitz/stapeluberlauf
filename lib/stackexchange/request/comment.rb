module StackExchange
  class Request
    class Comment < Request
      include Behavior::Editable
      include Behavior::Flagable
      include Behavior::Upvotable
    end
  end
end
