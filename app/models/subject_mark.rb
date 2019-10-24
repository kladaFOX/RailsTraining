class SubjectMark < ApplicationRecord
  belongs_to :student
  belongs_to :subject

  def self.unsatisfactory
    SubjectMark.where("mark <= 3").includes(:student)
  end

  def self.satisfactory
    SubjectMark.where("mark >= 4").includes(:student)
  end

  def self.average
    SubjectMark.group(:student_id).select(:student_id).average(:mark)
  end
  def self.last_names_average
    output = {}
    SubjectMark.average.each do |key, value|
      last_name = Student.find(key).try(:last_name)
      output[last_name] = value.to_f
    end
    output
  end

  
end
