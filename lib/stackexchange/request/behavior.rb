module StackExchange
  class Request
    module Behavior
      autoload :Acceptable,  'stackexchange/request/behaviors/acceptable.rb'
      autoload :Commentable, 'stackexchange/request/behaviors/commentable.rb'
      autoload :Downvotable, 'stackexchange/request/behaviors/downvotable.rb'
      autoload :Editable,    'stackexchange/request/behaviors/editable.rb'
      autoload :Favoritable, 'stackexchange/request/behaviors/favoritable.rb'
      autoload :Flagable,    'stackexchange/request/behaviors/flagable.rb'
      autoload :Upvotable,   'stackexchange/request/behaviors/upvotable.rb'
    end
  end
end
