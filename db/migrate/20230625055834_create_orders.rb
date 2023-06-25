class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.time :order_time
      t.date :order_date
      t.integer :order_state
      t.belongs_to :client

      t.timestamps
    end
  end
end
