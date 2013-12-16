# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'baidu_push/version'

Gem::Specification.new do |spec|
  spec.name          = 'baidu_push'
  spec.version       = BaiduPush::VERSION
  spec.authors       = ['fahchen']
  spec.email         = ['dev.fah@gmail.com']
  spec.description   = %q{The ruby wrapper of baidu push.}
  spec.summary       = %q{The ruby wrapper of baidu push.}
  spec.homepage      = 'https://github.com/fahchen/baidu_push/'
  spec.license       = 'MIb'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'httparty', ['>= 0.11.0']
end
