# frozen_string_literal: true

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
end

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'rubocop-codeur'
require 'rubocop-minitest'

require 'minitest/autorun'
require 'rubocop/minitest/support'
