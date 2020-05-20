class RemoveTittleToProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :tittle, :string
  end
end
