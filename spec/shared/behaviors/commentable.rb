shared_examples 'commentable' do
  describe :comments do
    subject { super().comments }

    it 'returns the endpoint' do
      expect(subject.endpoint).to eq "#{base_request.endpoint}/comments"
    end
  end
end
