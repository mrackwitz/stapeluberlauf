shared_examples 'favoritable' do
  describe :favorite do
    subject { super().favorite }

    it_behaves_like 'requires auth'

    it 'returns the endpoint' do
      expect(subject.endpoint).to eq "#{base_request.endpoint}/favorite"
    end
  end

  describe :undo_favorite do
    subject { super().undo_favorite }

    it_behaves_like 'requires auth'

    it 'returns the endpoint' do
      expect(subject.endpoint).to eq "#{base_request.endpoint}/favorite/undo"
    end
  end
end
