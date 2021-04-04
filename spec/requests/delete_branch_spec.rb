require 'rails_helper'

RSpec.describe "delete a branch route", type: :request do
  before do
    @branch1 = FactoryBot.create(:branch)
    @branch2 = FactoryBot.create(:branch)
    delete api_v1_branch_path(@branch1.id)
  end
  
  it 'destroys a branch by id' do
    expect(JSON.parse(response.body)['message']).to eq("Delete successful!")
  end
  
  it 'does not destroy other branches' do
    get api_v1_branches_path
    expect(JSON.parse(response.body).size).to eq(1)
    expect(JSON.parse(response.body).first['id']).to eq(@branch2.id)
  end
  
  it 'returns status code 200' do
    expect(response).to have_http_status(:ok)
  end
end
