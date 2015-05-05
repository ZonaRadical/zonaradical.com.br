json.array!(@offer_participants) do |offer_participant|
  json.extract! offer_participant, :id, :offer_id, :user_id
  json.url offer_participant_url(offer_participant, format: :json)
end
