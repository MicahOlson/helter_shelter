require 'rails_helper'

RSpec.describe "patch a boarder route", type: :request do
  before do
    @branch = Branch.create(location: 'Portland')
    @boarder = Boarder.create(branch_id: @branch.id,
                              name: 'Fluffy',
                              kind: 'Cat',
                              breed: 'Manx')
    patch api_v1_branch_boarder_path(@branch.id, @boarder.id), params: {name: 'Snowball'}
  end

  it 'updates a boarder' do
    expect(Boarder.find(@boarder.id).name).to eq('Snowball')
  end

  it 'returns status code 202' do
    expect(response).to have_http_status(:accepted)
  end
end
