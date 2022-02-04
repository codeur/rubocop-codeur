# frozen_string_literal: true

require_relative 'lib/rubocop/codeur/version'

Gem::Specification.new do |spec|
  spec.name          = 'rubocop-codeur'
  spec.version       = RuboCop::Codeur::VERSION
  spec.authors       = ['Codeur']
  spec.email         = ['dev@codeur.com']

  spec.summary       = 'Codeur rubocop config gem'
  spec.description   = 'Shared rubocop config gem for every Ruby projects at Codeur SARL'
  spec.homepage      = 'https://github.com/codeur/rubocop-codeur'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.0')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.add_dependency 'rubocop', '~> 1.25'
  spec.add_dependency 'rubocop-minitest', '~> 0.10', '>=0.10.2'
  spec.add_dependency 'rubocop-performance', '~> 1.9', '>= 1.9.2'
  spec.add_dependency 'rubocop-rails', '~> 2.9', '>= 2.9.1'
end
