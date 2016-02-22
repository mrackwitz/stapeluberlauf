require_relative '../../../spec/helper'

describe Stapeluberlauf::Request::Comment do
  let(:site) { Stapeluberlauf.site('stackoverflow') }
  let(:base_request) { site.comment('3301303') }
  subject { base_request }

  it_behaves_like 'editable'
  it_behaves_like 'flagable'
  it_behaves_like 'upvotable'
end
