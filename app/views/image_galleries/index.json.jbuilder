json.array!(@tips) do |tip|
  json.extract! tip, :id, :title, :image, :body
  json.url tip_url(tip, format: :json)
end
