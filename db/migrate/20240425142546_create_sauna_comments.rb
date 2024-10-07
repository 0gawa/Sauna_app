class CreateSaunaComments < ActiveRecord::Migration[7.0]
  def change
    create_table :sauna_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :sauna_id

      t.integer :aufguss, default: "0"
      t.integer :autorolly, default: "0"
      t.integer :air_bath, default: "0"
      t.integer :whisking, default: "0"
      t.integer :restaurant, default: "0"
      t.integer :water, default: "0"
      t.integer :parking, default: "0"
      t.integer :age, default: "0"

      t.timestamps
    end
  end
end
