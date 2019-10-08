class Group < ApplicationRecord
  has_many :students, dependent: :destroy
  belongs_to :university
  validates :number, presence: true
  validates :number, length: { is: 6 }
  validates :number, numericality: { grater_than: 0 }
end
