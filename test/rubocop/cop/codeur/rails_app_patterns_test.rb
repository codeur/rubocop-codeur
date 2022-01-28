# frozen_string_literal: true

require 'test_helper'

module RuboCop
  module Cop
    module Codeur
      class RailsAppPatternsTest < ::RuboCop::Cop::Minitest
        def test_forbidden_patterns
          @cop.cop_config['ForbiddenPatterns'] = %w[weirds modules]

          assert_offense(<<~RUBY, open_file('app/weirds/foo_weird.rb'))
            # frozen_string_literal: true
            ^{} `weirds` are forbidden.
            module FooWeird
            end
          RUBY

          assert_no_offenses(<<~RUBY, open_file('app/models/foo_bar.rb'))
            # frozen_string_literal: true

            class FooBar
            end
          RUBY
        end

        def test_allowed_patterns
          @cop.cop_config['AllowedPatterns'] = %w[models controllers views]

          assert_offense(<<~RUBY, open_file('app/weirds/foo_weird.rb'))
            # frozen_string_literal: true
            ^{} `weirds` are not allowed. Allowed patterns are: `models`, `controllers`, `views`.
            module FooWeird
            end
          RUBY

          assert_no_offenses(<<~RUBY, open_file('app/models/foo_bar.rb'))
            # frozen_string_literal: true

            class FooBar
            end
          RUBY
        end

        private

        def open_file(path)
          file = root.join('tmp', 'dummy', path)
          FileUtils.mkdir_p(file.dirname)
          File.open(file, 'wb')
        end
      end
    end
  end
end
