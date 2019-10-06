class CreateLecturers < ActiveRecord::Migration[6.0]
  def change
    create_table :lecturers do |t|
      t.belongs_to :subject
      t.string :last_name
      t.string :first_name
      t.string :patronymic
      t.timestamps
    end
  end
end
