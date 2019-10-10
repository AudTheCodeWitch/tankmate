class Tank < ApplicationRecord
  belongs_to :user
  has_many :fish
  has_many :plants
end
