# frozen_string_literal: true

require 'lint_roller'

module RuboCop
  module Codeur
    # This class represents a RuboCop Codeur plugin.
    class Plugin < LintRoller::Plugin
      def about
        LintRoller::About.new(
          name: 'rubocop-codeur',
          version: VERSION,
          homepage: 'https://github.com/codeur/rubocop-codeur',
          description: 'A collection of RuboCop cops to check design patterns.'
        )
      end

      def supported?(context)
        context.engine == :rubocop
      end

      def rules(_context)
        project_root = Pathname.new(__dir__).join('../../..')

        LintRoller::Rules.new(type: :path, config_format: :rubocop, value: project_root.join('config', 'default.yml'))
      end
    end
  end
end
