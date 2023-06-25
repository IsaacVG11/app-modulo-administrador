class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :full_name
      t.string :address
      t.string :email
      t.string :password
      t.integer :client_state

      t.timestamps
    end
  end
end
