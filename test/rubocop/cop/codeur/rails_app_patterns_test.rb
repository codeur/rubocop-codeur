# frozen_string_literal: true

require 'test_helper'

module RuboCop
  module Cop
    module Codeur
      class RailsAppPatternsTest < ::Minitest::Test
        def test_forbidden_patterns
          cop.cop_config['ForbiddenPatterns'] = %w[weirds modules]

          assert_offense(<<~RUBY, open_file('app/weirds/foo_forbidden_weird.rb'))
            # frozen_string_literal: true
            ^{} `weirds` are forbidden.
            module FooForbiddenWeird
            end
          RUBY

          assert_no_offenses(<<~RUBY, open_file('app/models/foo_bar.rb'))
            # frozen_string_literal: true

            class FooBar
            end
          RUBY
        end

        def test_forbidden_patterns_in_test
          cop.cop_config['ForbiddenPatterns'] = %w[weirds modules]

          assert_offense(<<~RUBY, open_file('test/weirds/foo_forbidden_weird_test.rb'))
            # frozen_string_literal: true
            ^{} `weirds` are forbidden.
            module FooForbiddenWeird
            end
          RUBY
        end

        def test_allowed_patterns
          cop.cop_config['AllowedPatterns'] = %w[models controllers views]

          assert_offense(<<~RUBY, open_file('app/weirds/foo_not_allowed_weird.rb'))
            # frozen_string_literal: true
            ^{} `weirds` are not allowed. Allowed patterns are: `models`, `controllers`, `views`.
            module FooNotAllowedWeird
            end
          RUBY

          assert_no_offenses(<<~RUBY, open_file('app/models/foo_baz.rb'))
            # frozen_string_literal: true

            class FooBaz
            end
          RUBY
        end

        private

        def open_file(path)
          file = Pathname.new(__dir__).join('../../../../tmp/dummy', path)
          FileUtils.mkdir_p(file.dirname)
          File.open(file, 'wb')
        end
      end
    end
  end
end
