class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.references :user, foreign_key: true, null: false
      t.references :sauna, foreign_key: true, null: false
      t.integer :count, null: false
      t.text :impression
      t.integer :sauna_time, null: false
      t.integer :water_time, null: false
      t.integer :totonoi_time, null: false

      t.timestamps
    end
  end
end
