json.array!(@offer_owners) do |offer_owner|
  json.extract! offer_owner, :id, :offer_id, :user_id
  json.url offer_owner_url(offer_owner, format: :json)
end
