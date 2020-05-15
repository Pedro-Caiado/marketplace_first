class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :model
      t.text :description
      t.string :condition
      t.string :finish
      t.string :tittle
      t.decimal :price, precision: 8, scale: 2, default: 0

      t.timestamps
    end
  end
end
