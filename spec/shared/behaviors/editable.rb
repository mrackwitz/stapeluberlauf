shared_examples 'editable' do
  describe :edit do
    subject { super().edit }

    it_behaves_like 'requires auth'

    it 'returns the endpoint' do
      expect(subject.endpoint).to eq "#{base_request.endpoint}/edit"
    end
  end

  describe :delete do
    subject { super().delete }

    it_behaves_like 'requires auth'

    it 'returns the endpoint' do
      expect(subject.endpoint).to eq "#{base_request.endpoint}/delete"
    end
  end
end
