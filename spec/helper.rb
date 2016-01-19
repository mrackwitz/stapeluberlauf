# Setup simplecov
if RUBY_ENGINE == 'ruby'
  require 'simplecov'

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
      SimpleCov::Formatter::HTMLFormatter,
  ])
  SimpleCov.start
end

require 'stackexchange'
require 'rspec'

# Require shared behaviors
require 'shared/behaviors/requires_auth'
require 'shared/behaviors/acceptable'
require 'shared/behaviors/commentable'
require 'shared/behaviors/downvotable'
require 'shared/behaviors/editable'
require 'shared/behaviors/favoritable'
require 'shared/behaviors/flagable'
require 'shared/behaviors/upvotable'

# Setup RSpec
RSpec.configure do |config|
  config.raise_errors_for_deprecations!
end
