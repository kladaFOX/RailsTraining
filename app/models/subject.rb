class Subject < ApplicationRecord
  has_many :students, :through => :subject_marks
  has_one :lecturer, dependent: :destroy
end
