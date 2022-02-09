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

build: gen/ *.gemspec version.txt
	gem build informativos-api.gemspec 

push: build version.txt
	gem push informativos-api-$(VERSION).gem

remove:
	gem yank $(GEM) -v $(VERSION)

repush: build
	gem yarn $(GEM) -v $(VERSION)
	gem push informativos-api-$(VERSION).gem

gen: *.proto
	gem list "^grpc-tools$$" -i || gem install grpc-tools
	grpc_tools_ruby_protoc --ruby_out=./gen --grpc_out=./gen $(PROTO_FILES)
