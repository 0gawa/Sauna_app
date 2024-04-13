class CreateSaunas < ActiveRecord::Migration[7.0]
  def change
    create_table :saunas do |t|
      t.string :name
      t.string :address
      t.references :sauna, foreign_key: true
      t.references :water, foreign_key: true
      t.references :sauna_info, foreign_key: true

      t.timestamps
    end
  end
end
