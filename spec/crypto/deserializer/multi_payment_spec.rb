require 'spec_helper'

describe ArkEcosystem::Crypto::Deserializers::MultiPayment do
  describe '#deserialize' do
    skip it 'should be ok' do
      transaction = JSON.parse!(File.read('spec/fixtures/transactions/multi_payment.json'), object_class: OpenStruct)

      ArkEcosystem::Crypto::Configuration::Network.set(ArkEcosystem::Crypto::Networks::Devnet)

      actual = ArkEcosystem::Crypto::Deserializer.new(transaction['serialized']).deserialize

      expect(actual.id).to eq(transaction[:id])
    end
  end
end
