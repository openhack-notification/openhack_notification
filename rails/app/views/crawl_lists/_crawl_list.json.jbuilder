json.extract! crawl_list, :id, :title, :is_message_send, :created_at, :updated_at
json.url crawl_list_url(crawl_list, format: :json)
