FILE := version.txt
VERSION := `cat $(FILE)`

all: rb/gen

up:
	docker-compose run --rm app bash

build: rb/*.gemspec version.txt
	gem build rb/informativos-api.gemspec 

publish: build
	gem push rb/informativos-api-$(VERSION).gem

rb/gen: *.proto
	gem list "^grpc-tools$$" -i || gem install grpc-tools
	grpc_tools_ruby_protoc --ruby_out=./rb/gen --grpc_out=./rb/gen ./*.proto
