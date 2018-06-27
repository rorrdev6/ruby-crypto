require 'ark_crypto/crypto'
require 'ark_crypto/message'

require 'ark_crypto/configuration/fee'
require 'ark_crypto/configuration/network'

require 'ark_crypto/enums/fees'
require 'ark_crypto/enums/types'

require 'ark_crypto/identity/address'
require 'ark_crypto/identity/private_key'
require 'ark_crypto/identity/public_key'
require 'ark_crypto/identity/wif'

require 'ark_crypto/models/transaction'
require 'ark_crypto/networks/devnet'
require 'ark_crypto/networks/mainnet'
require 'ark_crypto/networks/testnet'

require 'ark_crypto/serialisers/delegate_registration'
require 'ark_crypto/serialisers/delegate_resignation'
require 'ark_crypto/serialisers/ipfs'
require 'ark_crypto/serialisers/multi_payment'
require 'ark_crypto/serialisers/multi_signature_registration'
require 'ark_crypto/serialisers/second_signature_registration'
require 'ark_crypto/serialisers/timelock_transfer'
require 'ark_crypto/serialisers/transfer'
require 'ark_crypto/serialisers/vote'

require 'ark_crypto/deserialisers/delegate_registration'
require 'ark_crypto/deserialisers/delegate_resignation'
require 'ark_crypto/deserialisers/ipfs'
require 'ark_crypto/deserialisers/multi_payment'
require 'ark_crypto/deserialisers/multi_signature_registration'
require 'ark_crypto/deserialisers/second_signature_registration'
require 'ark_crypto/deserialisers/timelock_transfer'
require 'ark_crypto/deserialisers/transfer'
require 'ark_crypto/deserialisers/vote'

module ArkCrypto
  class << self
    def initialize
      print "Hello World"
    end
  end
end
