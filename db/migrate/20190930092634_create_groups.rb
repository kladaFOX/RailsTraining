class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.integer :number
      t.integer :number_of_people
      t.timestamps
    end
  end
end
