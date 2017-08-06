json.extract! innerpost, :id, :title, :content, :post_id, :created_at, :updated_at
json.url innerpost_url(innerpost, format: :json)
