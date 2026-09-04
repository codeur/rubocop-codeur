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
  spec.required_ruby_version = '>= 3.4'

  spec.metadata['default_lint_roller_plugin'] = 'RuboCop::Codeur::Plugin'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features|bin)/}) || f.match(/^(Gemfile|README|.*\.gemspec)/)
    end
  end

  spec.add_dependency 'lint_roller', '~> 1.1'
  spec.add_dependency 'rubocop', '>= 1.90', '< 2.0'
  spec.add_dependency 'rubocop-capybara', '~> 3.0'
  spec.add_dependency 'rubocop-factory_bot', '~> 2.28'
  spec.add_dependency 'rubocop-minitest', '~> 0.40'
  spec.add_dependency 'rubocop-performance', '~> 1.27'
  spec.add_dependency 'rubocop-rails', '~> 2.37'
end
