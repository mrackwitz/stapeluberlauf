shared_examples 'downvotable' do
  describe :downvote do
    subject { super().downvote }

    it_behaves_like 'requires auth'

    it 'returns the endpoint' do
      expect(subject.endpoint).to eq "#{base_request.endpoint}/downvote"
    end
  end

  describe :undo_downvote do
    subject { super().undo_downvote }

    it_behaves_like 'requires auth'

    it 'returns the endpoint' do
      expect(subject.endpoint).to eq "#{base_request.endpoint}/downvote/undo"
    end
  end
end
