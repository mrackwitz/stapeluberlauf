# Setup simplecov
if RUBY_ENGINE == 'ruby'
  require 'simplecov'

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
      SimpleCov::Formatter::HTMLFormatter,
  ])
  SimpleCov.start
end

require 'stackexchange'
require 'vcr'
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

# Setup VCR
VCR.configure do |c|
  c.configure_rspec_metadata!
  c.default_cassette_options = {
      :preserve_exact_body_bytes  => false,
      :decode_compressed_response => true,
      :record                     => ENV['TRAVIS'] ? :none : :once
  }
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :faraday
end

# Inject VCR middleware into Faraday
StackExchange.default_client = Faraday.new(url: StackExchange::BASE_URI.dup) do |builder|
  builder.use VCR::Middleware::Faraday
  builder.adapter Faraday.default_adapter
end
