require 'ark_crypto/deserialisers/deserialiser'

module ArkCrypto
  module Deserialisers
    class TimelockTransfer < Deserialiser
      def handle(asset_offset, transaction)
        transaction[:amount] = @binary.unpack("C#{asset_offset / 2}Q<").last
        transaction[:timelocktype] = @binary.unpack("C#{asset_offset / 2 + 8}").last & 0xff
        transaction[:timelock] = @binary.unpack("C#{asset_offset / 2 + 9}Q<").last

        recipient_id = @binary.unpack("H#{(asset_offset / 2 + 13) * 2}H42").last
        transaction[:recipient_id] = BTC::Base58.base58check_from_data([recipient_id].pack('H*'))

        ArkCrypto::Crypto::parse_signatures(@serialized, transaction, asset_offset + (21 + 13) * 2)
      end
    end
  end
end
