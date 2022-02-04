# RuboCop Codeur
Shared rubocop config gem for every Ruby projects at Codeur SARL

## Installation
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

You don't  need to include rubocop directly in your application's dependencies.
`rubocop-codeur` will include `rubocop`, `rubocop-minitest`, `rubocop-performance`,
and `rubocop-rails` dependencies.

It might be necessary to override style rules set in this gem for some projects
or to add specific ones. Rule inheritance provided by RuboCop works like the
following:
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

Note that those overriding should be avoided as much as possible.

## Testing

Run:
```bash
bin/rake test
```
or simply:
```bash
bin/rake
```

## Release
Before all, configure your credentials for RubyGems :

 1. Login to RubyGems
 2. Create a token which have rights to push gems (https://rubygems.org/profile/api_keys)
 3. Add it to your config:
   ```
   echo ":rubygems_api_key: YOUR_API_KEY" >> ~/.gem/credentials
   ```

You just have to run default command:
```
rake release
```

Else, to publish a new version of this gem, you'll need to build it with
`gem build rubocop-codeur.gemspec` and then push it manually:
```
gem push rubocop-codeur-X.X.X.gem
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT). Copyright 2021 Codeur SARL.
