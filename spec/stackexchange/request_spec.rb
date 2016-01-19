require_relative '../../spec/helper'

describe StackExchange::Request do
  let(:site) { StackExchange.site('stackoverflow') }

  before do
    @req = site.questions(tagged: 'ruby')
    @req.page_size = 2
  end

  describe 'with recorded execution', :vcr do
    describe :execute do
      it 'should retrieve 2 items' do
        res = @req.execute
        expect(res.has_more).to eq true
      end
    end
  end

  describe 'with mocked execution' do
    before do
      @res1 = double('1st response')
      expect(@res1).to receive(:has_more).and_return(true)
      @res2 = double('2nd response')
      expect(@res2).to receive(:has_more).and_return(false)

      req2 = double('2nd request')
      expect(@req).to receive(:dup).and_return(req2)
      expect(req2).to receive(:page).and_return(1)
      expect(req2).to receive(:page=).with(2)

      expect(@req).to receive(:execute).and_return(@res1)
      expect(req2).to receive(:execute).and_return(@res2)
    end

    describe :pages do
      it 'should retrieve 2 pages' do
        expect(@req.pages.to_a).to eq [@res1, @res2]
      end
    end
  end
end