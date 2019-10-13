class Tank < ApplicationRecord
  belongs_to :user
  has_many :fish
  has_many :plants
  has_many :maintenances
  has_many :tanks, through: :maintenances

  validates_presence_of :name
  validates_uniqueness_of :name
  validates :size, numericality: { greater_than: 0 }
end
