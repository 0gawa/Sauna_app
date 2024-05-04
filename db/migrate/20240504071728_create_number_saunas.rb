class CreateNumberSaunas < ActiveRecord::Migration[7.0]
  def change
    create_table :number_saunas do |t|
      t.references :sauna, foreign_key: true, null: false
      t.references :sauna_info, foreign_key: true, null: false

      t.timestamps
    end
  end
end
