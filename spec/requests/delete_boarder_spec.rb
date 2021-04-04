require 'rails_helper'

RSpec.describe "delete a boarder route", type: :request do
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
    delete api_v1_branch_boarder_path(@branch.id, @boarder1.id)
  end

  it 'destroys a boarder by id' do
    expect(JSON.parse(response.body)['message']).to eq("Delete successful!")
  end

  it 'does not destroy other boarders' do
    get api_v1_branch_boarders_path(@branch.id)
    expect(JSON.parse(response.body).size).to eq(1)
    expect(JSON.parse(response.body).first['id']).to eq(@boarder2.id)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:ok)
  end
end
