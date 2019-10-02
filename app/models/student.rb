class Student < ApplicationRecord
  has_one :student_card, dependent: :destroy
  belongs_to :group,  counter_cache: :number_of_people
  has_many :common_students, class_name: "Student",
                          foreign_key: "headman_id"
  belongs_to :headman, class_name: "Student", optional: true

  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  validates :patronymic, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }, allow_nil: true

  before_validation :normalize_name, on: [ :create, :update ]

  private
    def normalize_name
      self.first_name = first_name.downcase.titleize
      self.last_name = last_name.downcase.titleize
      self.patronymic = patronymic.downcase.titleize unless self.patronymic.nil?
    end


end
