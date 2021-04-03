require 'rails_helper'

RSpec.describe "patch a branch route", type: :request do
  before do
    @branch = FactoryBot.create(:branch)
    patch api_v1_branch_path(@branch.id), params: {location: 'Portland'}
  end

  it 'updates a branch location name' do
    expect(Branch.find(@branch.id).location).to eq('Portland')
  end

  it 'returns status code 202' do
    expect(response).to have_http_status(:accepted)
  end
end
