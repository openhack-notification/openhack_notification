class CreateCrawlLists < ActiveRecord::Migration[5.1]
  def change
    create_table :crawl_lists do |t|
      t.string :title
      t.integer :is_message_send

      t.timestamps
    end
  end
end
