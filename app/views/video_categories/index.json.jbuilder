json.array!(@video_categories) do |video_category|
  json.extract! video_category, :id, :name, :parent_id, :description
  json.url video_category_url(video_category, format: :json)
end
