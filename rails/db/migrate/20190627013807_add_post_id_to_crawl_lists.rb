class AddPostIdToCrawlLists < ActiveRecord::Migration[5.1]
  def change
    add_reference :crawl_lists, :post, foreign_key: true
  end
end
