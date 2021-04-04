require 'rails_helper'

RSpec.describe "search boarders route", type: :request do
  before do
    @branch = Branch.create(location: 'Portland')
    @boarder1 = Boarder.create(branch_id: @branch.id,
                               name: 'Fluffy',
                               kind: 'Cat',
                               breed: 'Manx')
    @boarder2 = Boarder.create(branch_id: @branch.id,
                               name: 'Snowball',
                               kind: 'Cat',
                               breed: 'Maine Coon')
  end
              
  it 'returns all boarders of a breed' do
    get api_v1_search_path, params: {q: 'Manx'}
    expect(JSON.parse(response.body).size).to eq(1)
    expect(JSON.parse(response.body).first['name']).to eq('Fluffy')
  end
  
  it 'returns all boarders if no query given' do
    get api_v1_search_path
    expect(JSON.parse(response.body).size).to eq(2)
    expect(JSON.parse(response.body).first['name']).to eq('Fluffy')
    expect(JSON.parse(response.body).last['name']).to eq('Snowball')
  end
  
  it 'returns status code 200' do
    get api_v1_search_path, params: {q: 'Manx'}
    expect(response).to have_http_status(:success)
  end

  it 'returns status code 404 if no records are found' do
    get api_v1_search_path, params: {q: 'Labrador'}
    expect(response).to have_http_status(:not_found)
    expect(JSON.parse(response.body)['message']).to eq("No breeds match the query Labrador.")
  end
end
