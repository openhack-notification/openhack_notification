class CreateSubscribes < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribes do |t|
      # Subscribe.create(post_id: 1, user_id: 1, keyword_1: "장학", keyword_2: "학사", sms: true, mail: false, push: false)
      t.integer :post_id
      t.integer :user_id
      t.string :keyword_1
      t.string :keyword_2
      t.boolean :sms, default: false
      t.boolean :mail, default: false
      t.boolean :push, default: false

      t.timestamps
    end
  end
end
