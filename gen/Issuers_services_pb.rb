# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: Issuers.proto for package 'informativos'

require 'grpc'
require 'Issuers_pb'

module Informativos
  module Issuers
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'informativos.Issuers'

      rpc :GetIssuers, ::Informativos::GetIssuersReq, stream(::Informativos::Issuer)
    end

    Stub = Service.rpc_stub_class
  end
end
