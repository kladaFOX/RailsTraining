class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.integer :cart_id
      t.integer :course_id
      t.integer :quantity
      t.timestamps
    end
  end
end
