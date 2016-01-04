require 'stackexchange/authorizable.rb'
require 'stackexchange/request.rb'

module StackExchange
  class Request
    class Site < Request
      # Gets questions on the site.
      #
      # @param [String|Array] ids  one or multiple ids
      #
      # @param [Hash] params  the parameter
      #
      # @option params [String] tagged  one or multiple tags
      #
      # @return [Request]
      #
      def questions(ids=nil, **params)
        sub_collection(Question, ids, 'questions', params)
      end
      alias_method :question, :questions

      # Gets answers on the site.
      #
      # @param [String|Array] ids  one or multiple ids
      #
      # @return [Request]
      #
      def answers(ids=nil, **params)
        sub_collection(Answer, ids, 'answers', params)
      end
      alias_method :answer, :answers

      # Gets comments on the site.
      #
      # @param [String|Array] ids  one or multiple ids
      #
      # @return [Request]
      #
      def comments(ids=nil, **params)
        sub_collection(Comment, ids, 'comments', params)
      end
      alias_method :comment, :comments
    end
  end
end
