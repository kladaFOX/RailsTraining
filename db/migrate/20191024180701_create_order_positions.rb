class CreateOrderPositions < ActiveRecord::Migration[6.0]
  def change
    create_table :order_positions do |t|
      t.integer :order_id
      t.integer :course_id
      t.integer :quantity
      t.timestamps
    end
  end
end
