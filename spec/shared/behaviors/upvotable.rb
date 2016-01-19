shared_examples 'upvotable' do
  subject { @base_path = super().endpoint; super() }
  let(:base_path) { @base_path }

  describe :upvote do
    subject { super().upvote }

    it_behaves_like 'requires auth'

    it 'returns the endpoint' do
      expect(subject.endpoint).to eq "#{base_path}/upvote"
    end
  end

  describe :undo_upvote do
    subject { super().undo_upvote }

    it_behaves_like 'requires auth'

    it 'returns the endpoint' do
      expect(subject.endpoint).to eq "#{base_path}/upvote/undo"
    end
  end
end
