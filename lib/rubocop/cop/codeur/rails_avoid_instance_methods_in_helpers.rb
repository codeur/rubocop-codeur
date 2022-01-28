# frozen_string_literal: true

module RuboCop
  module Cop
    module Codeur
      # This cop makes sure that Rails helpers only uses class methods in order
      # to be able to use them in the test, views or from anywhere else.
      # ApplicationHelper is excluded from this rule by default.
      #
      # @example
      #   # bad
      #   module CoolHelper
      #     def foobar
      #       # ...
      #     end
      #   end
      #
      #   # good
      #   module CoolHelper
      #     def self.foobar
      #       # ...
      #     end
      #   end
      #
      class RailsAvoidInstanceMethodsInHelpers < Base
        MSG = 'Prefer class methods in helpers.'

        def on_def(node)
          # NOTE: :sclass node is a "class << self" node
          return if node.parent.sclass_type?

          add_offense(node)
        end
      end
    end
  end
end
