# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: Prices.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("Prices.proto", :syntax => :proto3) do
    add_message "informativos.GetPricesReq" do
      optional :updated_since, :uint64, 1
      optional :origin, :string, 2
      optional :security_type, :string, 3
      optional :date, :uint64, 4
    end
    add_message "informativos.Price" do
      optional :updated_at, :uint64, 1
      optional :id, :string, 2
      optional :security, :string, 3
      optional :settlement_date, :uint64, 4
      optional :date, :uint64, 5
      optional :close, :double, 6
      optional :open, :double, 7
      optional :high, :double, 8
      optional :low, :double, 9
      optional :average, :double, 10
      optional :bid, :double, 11
      optional :ask, :double, 12
      optional :volume, :double, 13
      optional :quantity, :double, 14
      optional :trades, :double, 15
      optional :change, :double, 16
      optional :a_change, :float, 17
      optional :origin, :string, 18
    end
  end
end

module Informativos
  GetPricesReq = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("informativos.GetPricesReq").msgclass
  Price = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("informativos.Price").msgclass
end
