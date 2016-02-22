require_relative '../../../spec/helper'

describe Stapeluberlauf::Request::Site do
  before do
    @site = Stapeluberlauf.site('stackoverflow')
  end

  describe :question do
    it 'should return the relative uri for a request for the question identified by the given id' do
      req = @site.question('55574')
      expect(req).to be_a Stapeluberlauf::Request::Question
      expect(req.relative_uri.to_s).to eq '/questions/55574?site=stackoverflow'
    end
  end

  describe :questions do
    it 'should return the relative uri for a request for the questions identified by the given ids' do
      req = @site.questions(%w(55574 1113611))
      expect(req).to be_a Stapeluberlauf::Request::Question
      expect(req.relative_uri.to_s).to eq '/questions/55574;1113611?site=stackoverflow'
    end

    it 'should return the relative uri for a request for the questions tagged with given tags' do
      req = @site.questions(tagged: 'ruby')
      expect(req).to be_a Stapeluberlauf::Request::Question
      expect(req.relative_uri.to_s).to eq '/questions?tagged=ruby&site=stackoverflow'
    end
  end


  describe :answer do
    it 'should return the relative uri for a request for the answer identified by the given id' do
      req = @site.answer('55574')
      expect(req).to be_a Stapeluberlauf::Request::Answer
      expect(req.relative_uri.to_s).to eq '/answers/55574?site=stackoverflow'
    end
  end

  describe :answers do
    it 'should return the relative uri for a request for the answers identified by the given ids' do
      req = @site.answers(%w(55574 1113611))
      expect(req).to be_a Stapeluberlauf::Request::Answer
      expect(req.relative_uri.to_s).to eq '/answers/55574;1113611?site=stackoverflow'
    end
  end


  describe :comment do
    it 'should return the relative uri for a request for the comment identified by the given id' do
      req = @site.comment('55574')
      expect(req).to be_a Stapeluberlauf::Request::Comment
      expect(req.relative_uri.to_s).to eq '/comments/55574?site=stackoverflow'
    end
  end

  describe :comments do
    it 'should return the relative uri for a request for the comments identified by the given ids' do
      req = @site.comments(%w(55574 1113611))
      expect(req).to be_a Stapeluberlauf::Request::Comment
      expect(req.relative_uri.to_s).to eq '/comments/55574;1113611?site=stackoverflow'
    end
  end
end
