# frozen_string_literal: true

RSpec.shared_examples 'CovidTrackerApi Client Query' do
  context 'with incorrect query' do
    let(:response) do
      { message: 'Request is not valid' }.to_json
    end

    before(:each) do
      stub_request(
        :get,
        "https://covid19-tracker.p.rapidapi.com/#{query_type}/NOT_VALID_COUNTRY"
      ).to_return(body: response)
    end

    it 'returns error message' do
      query = client.send(query_type.to_sym, 'NOT_VALID_COUNTRY')
      expect(query.message).to eq 'Request is not valid'
    end
  end
end
