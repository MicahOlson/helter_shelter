require 'rails_helper'

RSpec.describe "random boarder route", type: :request do
  before do
    @branch = FactoryBot.create(:branch_with_boarders)
    get api_v1_random_path
  end
  
  it 'returns random boarder at a random branch' do
    expect(JSON.parse(response.body)['branch_id']).to eq(@branch.id)
  end
  
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
