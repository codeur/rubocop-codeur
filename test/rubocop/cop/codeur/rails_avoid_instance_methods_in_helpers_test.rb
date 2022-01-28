# frozen_string_literal: true

require 'test_helper'

module RuboCop
  module Cop
    module Codeur
      class RailsAvoidInstanceMethodsInHelpersTest < ::RuboCop::Cop::Minitest
        def test_register_an_offense_when_using_instance_method
          assert_offense(<<~RUBY)
            module FooHelper
              def bar
              ^^^^^^^ Prefer class methods in helpers.
                # ...
              end
            end
          RUBY
        end

        def test_no_offenses_when_using_a_singleton_method
          assert_no_offenses(<<~RUBY)
            module FooHelper
              def self.bar
                #...
              end
            end
          RUBY
        end

        def test_no_offenses_when_using_a_sclassed_method
          assert_no_offenses(<<~RUBY)
            module FooHelper
              class << self
                def bar
                  #...
                end
              end
            end
          RUBY
        end
      end
    end
  end
end
