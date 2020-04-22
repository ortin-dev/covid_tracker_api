# frozen_string_literal: true

require 'covid_tracker_api/client/queries'

module CovidTrackerApi
  class Client
    AVAILABLE_QUERIES = %w[all statistics].freeze
    BASE_HOST = 'covid19-tracker.p.rapidapi.com'

    include HTTParty
    include CovidTrackerApi::Client::Queries

    base_uri "https://#{BASE_HOST}"
    format :json

    def initialize(api_key = nil)
      @api_key = api_key
      self.class.default_options.merge!(headers: headers)
    end

    private def headers
      {
        'x-rapidapi-key' => @api_key || ENV['API_KEY'],
        'x-rapidapi-host' => BASE_HOST
      }
    end
  end
end
