class Boarder < ApplicationRecord
  validates :name, presence: true
  validates :kind, presence: true
  validates :breed, presence: true
end
