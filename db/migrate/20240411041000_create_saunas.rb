class CreateSaunas < ActiveRecord::Migration[7.0]
  def change
    create_table :saunas do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.references :water, foreign_key: true, null: false
      t.references :sauna_info, foreign_key: true, null: false
      t.text :express, null: false, default: ""

      t.timestamps
    end
  end
end
