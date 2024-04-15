class CreateWaters < ActiveRecord::Migration[7.0]
  def change
    create_table :waters do |t|
      t.integer :temperature, null: false
      t.string :explain, null: false

      t.timestamps
    end
  end
end
