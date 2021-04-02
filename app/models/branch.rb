class Branch < ApplicationRecord
  has_many :boarders, dependent: :destroy
  validates :location, presence: true
end
