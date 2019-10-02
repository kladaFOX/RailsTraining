class AddNumberColumnToStudentCard < ActiveRecord::Migration[6.0]
  def change
    add_column :student_cards, :card_number, :integer
  end
end
