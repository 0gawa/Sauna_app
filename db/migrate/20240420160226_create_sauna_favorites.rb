class CreateSaunaFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :sauna_favorites do |t|
      t.integer :user_id
      t.integer :sauna_id

      t.timestamps
    end
  end
end
