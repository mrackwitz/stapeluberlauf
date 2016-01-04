module StackExchange
  class Request
    class Answer < Request
      include Behavior::Acceptable
      include Behavior::Commentable
      include Behavior::Editable
      include Behavior::Flagable
      include Behavior::Upvotable
      include Behavior::Downvotable

      # Gets all questions the identified answers are on.
      #
      # @return [Request]
      #
      def questions
        sub('questions')
      end
    end
  end
end
