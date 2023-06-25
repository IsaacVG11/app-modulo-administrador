class CreateDishxorders < ActiveRecord::Migration[7.0]
  def change
    create_table :dishxorders do |t|

      t.timestamps
      t.belongs_to :order
      t.belongs_to :dish
    end
  end
end
