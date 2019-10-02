class StudentCard < ApplicationRecord
  belongs_to :student

  validates :card_number, :faculty, :form_of_training, presence: true
  validates :card_number, length: { is: 8 }
  validates :faculty, :form_of_training, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

end
