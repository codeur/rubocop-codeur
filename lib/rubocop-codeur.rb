# frozen_string_literal: true

require 'rubocop'

require_relative 'rubocop/codeur'
require_relative 'rubocop/codeur/version'
require_relative 'rubocop/codeur/inject'

RuboCop::Codeur::Inject.defaults!

require_relative 'rubocop/cop/codeur_cops'
