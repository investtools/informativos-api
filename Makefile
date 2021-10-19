all: rb/gen

up:
	docker-compose run --rm app bash

rb/gen: *.proto
	gem list "^grpc-tools$$" -i || gem install grpc-tools
	grpc_tools_ruby_protoc --ruby_out=./rb/gen --grpc_out=./rb/gen ./*.proto
