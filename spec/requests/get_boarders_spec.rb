require 'rails_helper'

RSpec.describe "get all boarders route", type: :request do
  before do
    @branch = FactoryBot.create(:branch_with_boarders)
    get api_v1_branch_boarders_path(@branch.id)
  end
  
  it 'returns all boarders at a branch' do
    expect(JSON.parse(response.body).size).to eq(15)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end