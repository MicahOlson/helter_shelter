require 'rails_helper'

RSpec.describe "post a branch route", type: :request do
  before do
    post api_v1_branches_path, params: {location: 'Gresham'}
  end

  it 'creates a branch' do
    expect(JSON.parse(response.body)['location']).to eq('Gresham')
  end

  it 'returns status code 201' do
    expect(response).to have_http_status(:created)
  end
end
