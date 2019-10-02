class CreateStudentCards < ActiveRecord::Migration[6.0]
  def change
    create_table :student_cards do |t|
      t.integer :student_id
      t.string :faculty
      t.string :form_of_training
      t.date :date_of_enrollment
      t.date :date_of_issue
      t.date :card_valid_until
      t.timestamps
    end
  end
end
