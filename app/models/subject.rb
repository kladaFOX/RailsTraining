class Subject < ApplicationRecord
  has_many :students, :through => :subject_marks
  has_many :subject_marks, dependent: :destroy
  has_one :lecturer, dependent: :destroy
end
