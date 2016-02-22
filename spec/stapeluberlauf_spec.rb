require_relative 'helper'

describe Stapeluberlauf do
  describe :site do
    it 'should return a Site with the given name' do
      req = Stapeluberlauf.site('stackoverflow')
      expect(req).to be_a Stapeluberlauf::Request::Site
      expect(req.site).to eq 'stackoverflow'
    end
  end
end
