class Course < ApplicationRecord
  has_many :positions
  has_many :carts, through: :positions
  has_many :order_positions
  has_many :order, through: :order_positions
end
