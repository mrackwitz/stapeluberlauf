require_relative '../../spec/helper'

describe Stapeluberlauf::Request do
  let(:site) { Stapeluberlauf.site('stackoverflow') }

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

      it 'should throw when the response is erroneous' do
        req = @req.use_filter('doesnotexist')
        expect { req.execute }.to raise_error do |error|
          expect(error).to be_a Stapeluberlauf::Error
          expect(error.request).to eq req
          expect(error.response).to be_a Stapeluberlauf::Response
          expect(error.id).to eq 400
          expect(error.message).to eq 'Invalid filter specified'
        end
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

    describe :all_items do
      it 'should retrieve 4 items' do
        items = [double('1st item'), double('2nd item'), double('3rd item'), double('4th item')]
        expect(@res1).to receive(:items).and_return(items[0..1])
        expect(@res2).to receive(:items).and_return(items[2..3])
        expect(@req.all_items.to_a).to eq items
      end
    end
  end
end