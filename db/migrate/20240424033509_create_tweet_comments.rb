class CreateTweetComments < ActiveRecord::Migration[7.0]
  def change
    create_table :tweet_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :tweet_id

      t.timestamps
    end
  end
end
