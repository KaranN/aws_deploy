json.posts do
  json.(@posts) do |post|
    json.id post.id
    json.title post.title
    json.body post.body
  end
end
