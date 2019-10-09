class Group < ApplicationRecord
  has_many :students, dependent: :destroy
  belongs_to :university
  belongs_to :session,  counter_cache: :number_of_groups
  validates :number, presence: true
  validates :number, length: { is: 6 }
  validates :number, numericality: { grater_than: 0 }
end
