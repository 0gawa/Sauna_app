class CreateSaunas < ActiveRecord::Migration[7.0]
  def change
    create_table :saunas do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.text :express, default: ""

      t.timestamps
    end
  end
end
