GEM := informativos-api
FILE := version.txt
VERSION := `cat $(FILE)`

all: rb/gen

up:
	docker-compose run --rm app bash

build: rb/gen rb/*.gemspec version.txt
	gem build rb/informativos-api.gemspec 

push: build version.txt
	gem push rb/informativos-api-$(VERSION).gem

remove:
	gem yarn $(GEM) -v $(VERSION)

repush: build
	gem yarn $(GEM) -v $(VERSION)
	gem push rb/informativos-api-$(VERSION).gem

rb/gen: *.proto
	gem list "^grpc-tools$$" -i || gem install grpc-tools
	grpc_tools_ruby_protoc --ruby_out=./rb/gen --grpc_out=./rb/gen ./*.proto
