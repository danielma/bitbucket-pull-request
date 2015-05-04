# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitbucket-pull-request/version'

Gem::Specification.new do |spec|
  spec.name          = "bitbucket-pull-request"
  spec.version       = BitbucketPullRequest::VERSION
  spec.authors       = ["Daniel Ma"]
  spec.email         = ["drailskid@yahoo.com"]

  spec.summary       = %q{Git plugin to create a bitbucket pull request}
  spec.description   = %q{Git plugin to create a bitbucket pull request}
  spec.homepage      = "https://github.com/danielma/bitbucket-pull-request"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "cocaine", "~> 0.5"
end
