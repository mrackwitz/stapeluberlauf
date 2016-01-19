shared_examples 'acceptable' do
  describe :accept do
    subject { super().accept }

    it_behaves_like 'requires auth'

    it 'returns the endpoint' do
      expect(subject.endpoint).to eq "#{base_request.endpoint}/accept"
    end
  end

  describe :undo_accept do
    subject { super().undo_accept }

    it_behaves_like 'requires auth'

    it 'returns the endpoint' do
      expect(subject.endpoint).to eq "#{base_request.endpoint}/accept/undo"
    end
  end
end
