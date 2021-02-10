# frozen_string_literal: true

lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/rubocop_codeur/version'

Gem::Specification.new do |spec|
  spec.name        = 'rubocop-codeur'
  spec.version     = RubocopCodeur::VERSION
  spec.authors     = ['Dev-team Codeur']
  spec.email       = ['dev@codeur.com']
  spec.homepage    = 'https://github.com/codeur/rubocop-codeur'
  spec.summary     = 'Codeur rubocop config gem'
  spec.description = 'Shared rubocop config gem for every Ruby projects at Codeur SARL'
  spec.license     = 'MIT'

  spec.metadata['allowed_push_host'] = 'https://rubygems.pkg.github.com/codeur/'

  spec.metadata['homepage_uri'] = spec.homepage

  spec.files = Dir['lib/**/*', 'MIT-LICENSE', 'README.md', 'default.yml']

  spec.required_ruby_version = '~> 2.6'
  spec.add_dependency 'rubocop', '~> 1.9.1'
  spec.add_dependency 'rubocop-minitest', '~> 0.10', '>=0.10.2'
  spec.add_dependency 'rubocop-performance', '~> 1.9', '>= 1.9.2'
  spec.add_dependency 'rubocop-rails', '~> 2.9', '>= 2.9.1'
end
