json.extract! post, :id, :title, :content, :author, :rate, :created_at, :updated_at
json.url post_url(post, format: :json)
