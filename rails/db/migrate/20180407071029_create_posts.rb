class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title # 제목
      t.string :url
      t.string :select_role

      t.timestamps
    end
  end
end
