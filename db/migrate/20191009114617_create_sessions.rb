class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.date :date
      t.integer :number_of_groups
      t.timestamps
    end
  end
end
