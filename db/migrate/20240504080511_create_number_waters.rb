class CreateNumberWaters < ActiveRecord::Migration[7.0]
  def change
    create_table :number_waters do |t|
      t.references :sauna, foreign_key: true, null: false
      t.references :water, foreign_key: true, null: false
      t.timestamps
    end
  end
end
