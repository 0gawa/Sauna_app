class CreateSaunas < ActiveRecord::Migration[7.0]
  def change
    create_table :saunas do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.float :latitude
      t.float :longitude
      t.string :time
      t.string :charge
      t.string :hp
      t.text :express

      t.timestamps
    end
  end
end
