module StackExchange
  class Request
    class Question < Site
      include Behavior::Commentable
      include Behavior::Editable
      include Behavior::Favoritable
      include Behavior::Flagable
      include Behavior::Upvotable
      include Behavior::Downvotable

      # Renders a hypothetical question.
      #
      # @note auth required
      #
      # @return [Request]
      #
      def render
        sub('render').auth_required!
      end

      # Creates a new question.
      #
      # @note auth required
      #
      # @return [Request]
      #
      def add
        sub('add').auth_required!
      end

      # Get the answers to the questions
      #
      # @return [Request]
      #
      def answers
        sub('answers')
      end

      # Creates an answer on the given question. auth required
      #
      # @return [Request]
      #
      def add_answer
        sub('answers/add')
      end

      # Renders a hypothetical answer to a question.
      #
      # @return [Request]
      #
      def render_answer
        sub('answers/render')
      end

      # Returns valid flag options which are also close reasons for the given question.
      #
      # @note auth required
      #
      # @return [Request]
      #
      def close_options
        sub('close/options').auth_required!
      end

      # Get the questions that link to the questions.
      #
      # @return [Request]
      #
      def linked
        sub('linked')
      end

      # Get the questions that are related to the questions.
      #
      # @return [Request]
      #
      def related
        sub('related')
      end

      # Get the timelines of the questions.
      #
      # @return [Request]
      #
      def timeline
        sub('timeline')
      end

      # Get all questions on the site with active bounties.
      #
      # @return [Request]
      #
      def featured
        sub('featured')
      end

      # Get all questions on the site with *no* answers.
      #
      # @return [Request]
      #
      def no_answers
        sub('no-answers')
      end

      # Get all questions the site considers unanswered.
      #
      # @return [Request]
      #
      def unanswered
        sub('unanswered')
      end

      # Get questions the site considers unanswered within a user's favorite or interesting tags.
      #
      # @note auth required
      #
      # @return [Request]
      #
      def unanswered_with_my_tags
        sub('unanswered/my-tags').auth_required!
      end
    end
  end
end
