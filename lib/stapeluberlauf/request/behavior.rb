module Stapeluberlauf
  class Request
    module Behavior
      autoload :Acceptable,  'stapeluberlauf/request/behaviors/acceptable.rb'
      autoload :Commentable, 'stapeluberlauf/request/behaviors/commentable.rb'
      autoload :Downvotable, 'stapeluberlauf/request/behaviors/downvotable.rb'
      autoload :Editable,    'stapeluberlauf/request/behaviors/editable.rb'
      autoload :Favoritable, 'stapeluberlauf/request/behaviors/favoritable.rb'
      autoload :Flagable,    'stapeluberlauf/request/behaviors/flagable.rb'
      autoload :Upvotable,   'stapeluberlauf/request/behaviors/upvotable.rb'
    end
  end
end
