# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: Holidays.proto for package 'informativos'

require 'grpc'
require 'Holidays_pb'

module Informativos
  module Holidays
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'informativos.Holidays'

      rpc :GetHolidays, ::Informativos::GetHolidaysReq, stream(::Informativos::Holiday)
    end

    Stub = Service.rpc_stub_class
  end
end
