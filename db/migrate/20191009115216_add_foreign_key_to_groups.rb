class AddForeignKeyToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :session_id, :bigint
  end
end
