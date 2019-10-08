class AddCollumsToAdress < ActiveRecord::Migration[6.0]
  def change
    add_column :adresses, :addressable_id, :bigint
    add_column :adresses, :addressable_type, :string
  end
end
