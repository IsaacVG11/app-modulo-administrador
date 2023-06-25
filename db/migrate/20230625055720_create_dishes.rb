class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :dish_name
      t.text :description
      t.money :price
      t.string :dish_image
      t.integer :dish_state

      t.timestamps
    end
  end
end
