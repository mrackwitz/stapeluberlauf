require 'stapeluberlauf/authorizable.rb'
require 'stapeluberlauf/request.rb'

module Stapeluberlauf
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
        resource_request(Question, ids, 'questions', params)
      end
      alias_method :question, :questions

      # Gets answers on the site.
      #
      # @param [String|Array] ids  one or multiple ids
      #
      # @return [Request]
      #
      def answers(ids=nil, **params)
        resource_request(Answer, ids, 'answers', params)
      end
      alias_method :answer, :answers

      # Gets comments on the site.
      #
      # @param [String|Array] ids  one or multiple ids
      #
      # @return [Request]
      #
      def comments(ids=nil, **params)
        resource_request(Comment, ids, 'comments', params)
      end
      alias_method :comment, :comments
    end
  end
end
