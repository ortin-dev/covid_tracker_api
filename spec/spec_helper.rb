# frozen_string_literal: true

require 'bundler/setup'
require 'covid_tracker_api'
require 'webmock/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  Dir['./spec/support/**/*.rb'].sort.each { |f| require f }
end
