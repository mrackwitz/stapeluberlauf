require_relative '../../../spec/helper'

describe StackExchange::Request::Comment do
  let(:site) { StackExchange.site('stackoverflow') }
  let(:base_request) { site.comment('3301303') }
  subject { base_request }

  it_behaves_like 'editable'
  it_behaves_like 'flagable'
  it_behaves_like 'upvotable'
end
