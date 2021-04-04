require 'rails_helper'

RSpec.describe "get a branch route", type: :request do
  let!(:branch) { FactoryBot.create_list(:branch, 20)}
  
  before do
    post api_v1_branches_path, params: {location: 'Portland'}
    get api_v1_branch_path(Branch.all.last.id)
  end

  it 'returns a branch' do
    expect(JSON.parse(response.body)['location']).to eq('Portland')
  end

  it 'returns status code 200 if successful' do
    expect(response).to have_http_status(:ok)
  end

  it 'returns status code 404 if not found' do
    get api_v1_branch_path(0)
    expect(response).to have_http_status(:not_found)
  end
end
