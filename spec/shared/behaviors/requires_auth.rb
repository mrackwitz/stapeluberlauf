shared_examples 'requires auth' do |req|
  it 'requires auth' do
    expect(subject.is_auth_required?).to eq true
  end
end
