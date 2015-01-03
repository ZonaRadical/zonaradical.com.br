json.array!(@breezes) do |breeze|
  json.extract! breeze, :id, :title, :image, :body
  json.url breeze_url(breeze, format: :json)
end
