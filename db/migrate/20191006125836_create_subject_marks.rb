class CreateSubjectMarks < ActiveRecord::Migration[6.0]
  def change
    create_table :subject_marks do |t|
      t.belongs_to :student
      t.belongs_to :subject
      t.integer :mark
      t.timestamps
    end
  end
end
