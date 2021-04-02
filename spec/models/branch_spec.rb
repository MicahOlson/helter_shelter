require 'rails_helper'

RSpec.describe Branch, type: :model do
  describe 'associations' do
    it { should have_many(:boarders).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:location) }
  end
end
