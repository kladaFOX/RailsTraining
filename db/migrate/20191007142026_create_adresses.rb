class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string :country
      t.string :region
      t.string :locality
      t.string :street
      t.string :house
      t.string :apartment
      t.timestamps
    end
  end
end
