class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone_number
      t.string :subject, null: false #件名かサウナ施設の名前
      t.string :content, null: false  #メッセージの内容またはサウナ施設の詳細
      t.string :prefecture  #サウナ施設がある県
      t.string :address     #サウナ施設の住所
      
      t.integer :is_read, null: false, default: 0   #対応に関するステータス：0未読, 1既読/未返信, 2既読/要対応, 3既読/対応済み
      t.integer :user_id, null: false
      t.integer :type, default: 0 #メッセージタイプ：0新しいサウナ施設に関して, 1問い合わせ
      t.timestamps
    end
  end
end
