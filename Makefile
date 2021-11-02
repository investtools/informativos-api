GEM := informativos-api
FILE := version.txt
VERSION := `cat $(FILE)`
GEM_PATTERN := informativos-api-.*\.gem$
GEM_FILES := `ls -1 rb | grep $(GEM_PATTERN)`
PROTO_PATTERN := \.proto$
PROTO_FILES := `ls -1 | grep $(PROTO_PATTERN)`

all: rb/gen

up:
	docker-compose run --rm app bash

clean:
	rm -rf $(GEM_FILES)

build: rb/gen rb/*.gemspec version.txt
	gem build rb/informativos-api.gemspec 

push: build version.txt
	gem push rb/informativos-api-$(VERSION).gem

remove:
	gem yank $(GEM) -v $(VERSION)

repush: build
	gem yarn $(GEM) -v $(VERSION)
	gem push rb/informativos-api-$(VERSION).gem

rb/gen: *.proto
	gem list "^grpc-tools$$" -i || gem install grpc-tools
	grpc_tools_ruby_protoc --ruby_out=./rb/gen --grpc_out=./rb/gen $(PROTO_FILES)
