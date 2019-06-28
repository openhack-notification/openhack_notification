class CreateBulletins < ActiveRecord::Migration[5.1]
  def change
    create_table :bulletins do |t|
      t.string :title # 제목
      t.timestamps
    end
  end
end
