class DropRecordBooks < ActiveRecord::Migration[6.0]
  def up
    drop_table :record_books
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
