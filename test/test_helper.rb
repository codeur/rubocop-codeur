# frozen_string_literal: true

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
end

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'rubocop-codeur'

require 'rubocop'
require 'minitest/autorun'
require 'rubocop/minitest/assert_offense'

module RuboCop
  module Cop
    class Minitest < ::Minitest::Test
      include RuboCop::Minitest::AssertOffense

      private

      def root
        Pathname.new(__dir__).parent
      end
    end
  end
end
