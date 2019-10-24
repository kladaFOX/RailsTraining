class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.float :amount
      t.integer :student_id
      t.timestamps
    end
  end
end
