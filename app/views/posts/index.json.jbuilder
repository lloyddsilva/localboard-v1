json.array!(@posts) do |post|
  json.extract! post, :id, :title, :content, :post_category_id, :user_id, :postable_id, :postable_type, :attached_document
  json.url post_url(post, format: :json)
end
