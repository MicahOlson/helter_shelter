require 'rails_helper'

RSpec.describe "post a boarder route", type: :request do
  before do
    @branch = Branch.create(location: 'Portland')
    post api_v1_branch_boarders_path(@branch.id), params: {branch_id: @branch.id,
                                                           name: 'Fluffy',
                                                           kind: 'Cat',
                                                           breed: 'Manx'}
  end

  it 'creates a boarder' do
    expect(JSON.parse(response.body)['name']).to eq('Fluffy')
  end

  it 'returns status code 201' do
    expect(response).to have_http_status(:created)
  end
end
