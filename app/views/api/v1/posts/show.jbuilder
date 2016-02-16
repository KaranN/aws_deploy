json.post do
  json.(@post, :id, :title, :body)
end