class Cart < ApplicationRecord
  belongs_to :student
  has_many :positions
  has_many :courses, through: :positions
end
