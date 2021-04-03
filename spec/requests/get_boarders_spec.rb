require 'rails_helper'

RSpec.describe "get all boarders route", type: :request do
  it 'returns all boarders at a branch' do
    @branch = FactoryBot.create(:branch_with_boarders)
    branch_id = @branch.id
    get api_v1_branch_boarders_path(branch_id)
    expect(JSON.parse(response.body).size).to eq(15)
  end

  it 'returns status code 200' do
    @branch = FactoryBot.create(:branch_with_boarders)
    branch_id = @branch.id
    get api_v1_branch_boarders_path(branch_id)
    expect(response).to have_http_status(:success)
  end
end
