module ArkCrypto
  module Serialisers
    class Serialiser
      def initialize(transaction)
        @transaction = transaction
        @serialized = transaction[:serialized]
        @binary = BTC::Data.data_from_hex(@serialized)
      end

      def serialise
        bytes = ''
        bytes << [0xff].pack('C')
        bytes << [@transaction[:version] ? @transaction[:version] : 0x01].pack('c')
        bytes << [@transaction[:network]].pack('c')
        bytes << [@transaction[:type]].pack('c')
        bytes << [@transaction[:timestamp]].pack('V')
        bytes << [@transaction[:senderPublicKey]].pack('H*')
        bytes << [@transaction[:fee]].pack('Q<')

        if @transaction[:vendorField]
          vendor_field_length = @transaction[:vendorField].length

          bytes << [vendor_field_length].pack('c')
          bytes << @transaction[:vendorField]
        elsif @transaction[:vendorFieldHex]
          vendor_field_hex_length = @transaction[:vendorFieldHex].length

          bytes << [vendor_field_hex_length / 2].pack('c')
          bytes << @transaction[:vendorFieldHex]
        else
          bytes << [0x00].pack('c')
        end

        transaction = self.handle(bytes)

        if @transaction[:signature]
          bytes << BTC::Data.data_from_hex(@transaction[:signature])
        end

        if @transaction[:second_signature]
          bytes << BTC::Data.data_from_hex(@transaction[:second_signature])
        elsif @transaction[:sign_signature]
          bytes << BTC::Data.data_from_hex(@transaction[:sign_signature])
        end

        if @transaction[:signatures]
          bytes << [0xff].pack('C')
          bytes << BTC::Data.data_from_hex(@transaction[:signatures].join(''))
        end

        BTC::Data.hex_from_data(bytes)
      end
    end
  end
end
