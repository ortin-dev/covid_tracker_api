# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CovidTrackerApi::Client do
  context 'Response statistics from covid analysis resource #STATISTICS query' do
    let(:client) { CovidTrackerApi::Client.new('api_key') }

    context 'With correct query' do
      let(:response) do
        {
          locations: [
            { 'coordinates' => { 'latitude' => 34.2233, 'longitude' => -82.4617 }, 'country' => 'US', 'country_code' => 'US', 'latest' => { 'confirmed' => 17, 'deaths' => 0, 'recovered' => 0 }, 'province' => 'Abbeville', 'state' => 'South Carolina' }
          ]
        }.to_json
      end

      before(:each) do
        stub_request(:get, 'https://covid19-tracker.p.rapidapi.com/statistics/').to_return(body: response)
      end

      it 'returns not empty array' do
        expect(client.statistics.locations).to_not be_empty
      end
    end

    let(:query_type) { 'statistics' }
    it_behaves_like 'CovidTrackerApi Client Query'
  end
end
