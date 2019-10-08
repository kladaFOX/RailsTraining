class AddForeignKeyToGroup < ActiveRecord::Migration[6.0]
  def change
      add_column :groups, :university_id, :bigint
  end
end
