# frozen_string_literal: true

module RuboCop
  module Cop
    module Codeur
      # This cop make sure that Rails app only uses patterns (app subdirectories)
      # defined in Cop config.
      #
      # @example ForbiddenPatterns: [presenters, view_objects, uploaders, modules]
      #   # bad
      #   app/presenters/order_presenter.rb
      #
      #   # bad
      #   app/modules/stuffy.rb
      #
      #   # good
      #   app/view_components/order_component.rb
      #
      #   # good
      #   app/models/concerns/stuffy.rb
      #
      # @example AllowedPatterns: [assets, channels, components, controllers, decorators, documents, helpers, inputs, javascript, jobs, mailers, models, serializers, services, views]
      #   # bad
      #   app/input/some_input.rb
      #
      #   # good
      #   app/inputs/some_input.rb
      #
      class RailsAppPatterns < Base
        MSG_FORBIDDEN = 'The %<pattern>s are forbidden.'.freeze
        MSG_NOT_ALLOWED = 'This %<pattern>s are not allowed. Allowed patterns are: %<allowed_patterns>s.'.freeze

        def on_new_investigation
          file_path = processed_source.file_path
          return if config.file_to_exclude?(file_path)

          for_bad_patterns(file_path) { |msg| add_global_offense(msg, severity: :warning) }
        end

      private

        def for_bad_patterns(file_path)
          pattern = pattern_from_path(file_path)

          if pattern_forbidden?(pattern)
            msg = format(MSG_FORBIDDEN,              pattern: pattern)
          elsif pattern_not_allowed?(pattern)
            msg = format(MSG_NOT_ALLOWED,              pattern: pattern, allowed_patterns: allowed_patterns.join(', '))
          end

          yield msg if msg
        end

        def pattern_from_path(path)
          path.split('/app/').last.split('/').first
        end

        def pattern_forbidden?(pattern)
          forbidden_patterns.any? && forbidden_patterns.include?(pattern)
        end

        def pattern_not_allowed?(pattern)
          allowed_patterns.any && allowed_patterns.exclude?(pattern)
        end

        def allowed_patterns
          cop_config['AllowedPatterns'] || []
        end

        def forbidden_patterns
          cop_config['ForbiddenPatterns'] || []
        end


      end
    end
  end
end
