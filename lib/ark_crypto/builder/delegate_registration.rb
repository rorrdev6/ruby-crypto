require 'ark_crypto/crypto'
require 'ark_crypto/enums/fees'
require 'ark_crypto/enums/types'
require 'ark_crypto/builder/transaction'
require 'ark_crypto/builder/utils/signing'

module ArkCrypto
  module Builder
    class DelegateRegistration
      include Utils::Signing

      def initialize
        @type = ArkCrypto::Enums::Types::DELEGATE_REGISTRATION
      end

      def username(username)
        @username = username
        self
      end

      def create
        @transaction = Transaction.new(
          :type => @type,
          :fee => @fee,
          :amount => 0
        )
        self
      end

      def sign(secret)
        key = ArkCrypto::Crypto.get_key(secret)

        asset = {
          :delegate => {
            username: @username,
            public_key: key.public_key.unpack('H*').first
          }
        }

        @transaction.set_asset(asset)

        @transaction.sign_and_create_id(secret)
        self
      end
    end
  end
end
