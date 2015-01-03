json.array!(@tip_categories) do |tip_category|
  json.extract! tip_category, :id, :name, :parent_id, :description
  json.url tip_category_url(tip_category, format: :json)
end
