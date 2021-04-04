require 'rails_helper'

RSpec.describe "get a boarder route", type: :request do
  before do
    @branch = Branch.create(location: 'Portland')
    @boarder = Boarder.create(name: 'Fluffy', kind: 'Cat', breed: 'Manx', branch_id: @branch.id)
    get api_v1_branch_boarder_path(@branch.id, @boarder.id)
  end
  
  it 'returns a boarder' do
    expect(JSON.parse(response.body)['name']).to eq('Fluffy')
  end
  
  it 'returns status code 200' do
    expect(response).to have_http_status(:ok)
  end
end
