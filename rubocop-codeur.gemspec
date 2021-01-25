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

  spec.metadata['allowed_push_host'] = 'https://gems.codeur.com'

  spec.metadata['homepage_uri'] = spec.homepage

  spec.files = Dir['lib/**/*', 'MIT-LICENSE', 'README.md']

  spec.required_ruby_version = '~> 2.6'
  spec.add_dependency 'rubocop'
  spec.add_dependency 'rubocop-minitest'
  spec.add_dependency 'rubocop-performance'
  spec.add_dependency 'rubocop-rails'
end
