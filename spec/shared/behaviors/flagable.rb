shared_examples 'flagable' do
  describe :add_flag do
    subject { super().add_flag }

    it_behaves_like 'requires auth'

    it 'returns the endpoint' do
      expect(subject.endpoint).to eq "#{base_request.endpoint}/flags/add"
    end
  end

  describe :flag_options do
    subject { super().flag_options }

    it_behaves_like 'requires auth'

    it 'returns the endpoint' do
      expect(subject.endpoint).to eq "#{base_request.endpoint}/flags/options"
    end
  end
end
