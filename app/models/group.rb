class Group < ApplicationRecord
  has_many :students

  validates :number, presence: true
  validates :number, length: { is: 6 }
  validates :number, numericality: { grater_than: 0 }
end
