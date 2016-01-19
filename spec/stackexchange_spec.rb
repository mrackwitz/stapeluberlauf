require_relative 'helper'

describe StackExchange do
  describe :site do
    it 'should return a Site with the given name' do
      req = StackExchange.site('stackoverflow')
      expect(req).to be_a StackExchange::Request::Site
      expect(req.site).to eq 'stackoverflow'
    end
  end
end
