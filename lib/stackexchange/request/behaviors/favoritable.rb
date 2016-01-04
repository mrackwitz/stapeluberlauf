module StackExchange
  class Request
    module Behavior
      module Favoritable
        # Favorites the given resource.
        #
        # @note auth required
        #
        # @return [Request]
        #
        def favorite
          sub('favorite').auth_required!
        end

        # Undoes favoriting the given resouce.
        #
        # @note auth required
        #
        # @return [Request]
        #
        def undo_favorite
          sub('favorite/undo').auth_required!
        end
      end
    end
  end
end
