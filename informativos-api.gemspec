# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "informativos-api"
  spec.version       = File.read(File.expand_path('../version.txt', __FILE__))
  spec.authors       = ["Breno Perricone Fischer"]
  spec.email         = ["breno@investtools.com.br"]
  spec.summary       = %q{Informativos API}
  spec.description   = %q{Informativos API wusing grpc protocol}
  spec.homepage      = "https://api.informativos.io/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib", "gen"]
end
