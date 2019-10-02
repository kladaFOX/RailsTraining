class AddHeadmanColumnToGroup < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :headman_id, :integer
  end
end
