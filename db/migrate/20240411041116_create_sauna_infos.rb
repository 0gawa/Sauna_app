class CreateSaunaInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :sauna_infos do |t|
      t.integer :temperature, null: false
      t.references :sauna, foreign_key: true
      t.string :express
      t.timestamps
    end
  end
end
