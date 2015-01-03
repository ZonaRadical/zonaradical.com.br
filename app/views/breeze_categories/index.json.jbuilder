json.array!(@breeze_categories) do |breeze_category|
  json.extract! breeze_category, :id, :name, :parent_id, :description
  json.url breeze_category_url(breeze_category, format: :json)
end
