class CreateStates < ActiveRecord::Migration[7.0]
  def change
    create_table :states do |t|
      t.integer :ontime
      t.integer :overtime
      t.integer :late

      t.timestamps
    end
  end
end
