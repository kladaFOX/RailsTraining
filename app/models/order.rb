class Order < ApplicationRecord
  belongs_to :student
  has_many :order_positions, dependent: :destroy
  has_many :courses, through: :order_positions
end
