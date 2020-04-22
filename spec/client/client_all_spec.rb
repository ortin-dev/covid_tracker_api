require 'spec_helper'

RSpec.describe CovidTrackerApi::Client do
  let(:client) { CovidTrackerApi::Client.new('api_key') }

  context 'Response global data from covid analysis resource #ALL query' do
    let(:response) do
      { 'confirmed' => 2_561_044, 'deaths' => 176_984, 'recovered' => 679_819 }.to_json
    end

    before(:each) do
      stub_request(:get, 'https://covid19-tracker.p.rapidapi.com/all/').to_return(body: response)
    end

    it 'returns confirmed number from resource' do
      expect(client.all.confirmed).to eql 2_561_044
    end

    it 'return correct keys' do
      expect(client.all.to_h.keys).to eql %i[confirmed deaths recovered]
    end
  end

  let(:query_type) { 'all' }
  it_behaves_like 'CovidTrackerApi Client Query'
end
