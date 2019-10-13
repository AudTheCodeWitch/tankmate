class Plant < ApplicationRecord
  belongs_to :tank
  validates_presence_of :species
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end
