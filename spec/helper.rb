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

# Setup RSpec
RSpec.configure do |config|
  config.raise_errors_for_deprecations!
end
