# Rubocop Codeur
Shared rubocop config gem for every Ruby projects at Codeur SARL

## Installation
In order to authenticate to the Github Packages service, you will need to go through [this guide](https://docs.github.com/en/packages/guides/configuring-rubygems-for-use-with-github-packages)

Add this lines to your application's Gemfile:
```ruby
group :development do
  gem 'rubocop-codeur'
end
```

Or, for a Ruby library, add this to your gemspec:
```ruby
spec.add_development_dependency 'rubocop-codeur'
```
## Usage
Create a `.rubocop.yml` with the following directives:
```yml
inherit_gem:
  rubocop-codeur:
    - default.yml
```

Then run:
`bundle exec rubocop`

You don't  need to include rubocop directly in your application's dependencies. rubocop-codeur will include `rubocop`, `rubocop-minitest`, `rubocop-performance` and `rubocop-rails` dependencies.

It might be necessary to override style rules set in this gem for some projects or to add specific ones. Rule inheritance provided by Rubocop works like the following:
`inherit_gem → inherit_from → local rules`

For example:
```yml
inherit_gem:
  rubocop-codeur:
    - default.yml

inherit_from: .some_rubocop_config_file.yml

AllCops:
  Exclude:
    - path/to/exluded/file.rb
```

Note that this should be limited to very project-specify needs in order to keep consistency across repos. Feel free to clone, checkout, update `default.yml` and submit a pull request if you want to suggest style rules changes.

## Development
To publish a new version of this gem, you'll need to build it with `gem build rubocop-codeur.gemspec` and then push it:
```
gem push --key github \
--host https://rubygems.pkg.github.com/codeur \
rubocop-codeur-X.X.X.gem
```
