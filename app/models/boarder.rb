class Boarder < ApplicationRecord
  belongs_to :branch
  validates :name, presence: true
  validates :kind, presence: true
  validates :breed, presence: true
  scope :search, -> (breed) { where("LOWER(breed) like ?", "%"+ "#{breed.downcase}" + "%")}
end
