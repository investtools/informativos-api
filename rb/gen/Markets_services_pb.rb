# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: Markets.proto for package 'informativos'

require 'grpc'
require 'Markets_pb'

module Informativos
  module Markets
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'informativos.Markets'

      rpc :GetMarkets, ::Informativos::GetMarketsReq, stream(::Informativos::Market)
    end

    Stub = Service.rpc_stub_class
  end
end
