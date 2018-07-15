describe ArkEcosystem::Crypto::Builder::DelegateRegistration do
  let(:passphrase) { 'this is a top secret passphrase' }
  let(:second_passphrase) { 'this is a top secret second passphrase' }
  let(:username) { 'polo polo' }

  it 'should be ok with a passhrase' do
    ArkEcosystem::Crypto::Configuration::Network.set(ArkEcosystem::Crypto::Networks::Devnet)

    transaction = described_class.new
    .set_username(username)
    .sign(passphrase)

    expect(transaction.verify).to be_truthy
  end

  it 'should be ok with a second passphrase' do
    ArkEcosystem::Crypto::Configuration::Network.set(ArkEcosystem::Crypto::Networks::Devnet)

    transaction = described_class.new
    .set_username(username)
    .sign(passphrase)
    .second_sign(second_passphrase)

    second_public_key_address = ArkEcosystem::Crypto::Identity::PublicKey.from_passphrase_as_hex(second_passphrase)

    expect(transaction.verify).to be_truthy
    expect(transaction.second_verify(second_public_key_address)).to be_truthy
  end
end
