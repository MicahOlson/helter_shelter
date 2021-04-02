require 'rails_helper'

RSpec.describe Boarder, type: :model do
  describe 'associations' do
    it { should belong_to(:branch) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:kind) }
    it { should validate_presence_of(:breed) }
  end
end
