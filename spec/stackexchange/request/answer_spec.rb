require_relative '../../../spec/helper'

describe Stapeluberlauf::Request::Answer do
  let(:site) { Stapeluberlauf.site('stackoverflow') }
  let(:base_request) { site.answer('4194189') }
  subject { base_request }

  it_behaves_like 'acceptable'
  it_behaves_like 'commentable'
  it_behaves_like 'editable'
  it_behaves_like 'flagable'
  it_behaves_like 'upvotable'
  it_behaves_like 'downvotable'

  describe :questions do
    subject { super().questions }

    it 'returns the endpoint' do
      expect(subject.endpoint).to eq "#{base_request.endpoint}/questions"
    end
  end
end
