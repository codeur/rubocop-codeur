# frozen_string_literal: true

require 'test_helper'

module RuboCop
  class CodeurTest < Minitest::Test
    def test_that_it_has_a_version_number
      refute_nil ::RuboCop::Codeur::VERSION
    end
  end
end
