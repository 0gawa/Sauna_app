class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.references :user, foreign_key: true, null: false
      t.references :sauna, foreign_key: true, null: false
      t.integer :count, null: false, default: 0
      t.text :impression
      t.integer :sauna_time, null: false, default: 3
      t.float :water_time, null: false, default: 0.167
      t.integer :totonoi_time, null: false, default: 5

      t.timestamps
    end
  end
end
