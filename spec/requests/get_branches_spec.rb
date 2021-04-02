require 'rails_helper'

RSpec.describe "get all branches route", type: :request do
  let!(:branch) { FactoryBot.create_list(:branch, 20)}

  before { get api_v1_branches_path }

  it 'returns all branches' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
