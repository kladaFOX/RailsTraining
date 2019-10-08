class DeleteMarkColumnFromSubject < ActiveRecord::Migration[6.0]
  def change
    remove_column :subjects, :mark
  end
end
