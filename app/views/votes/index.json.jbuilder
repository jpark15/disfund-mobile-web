json.array!(@votes) do |vote|
  json.extract! vote, :id, :user_id, :item_id
  json.url vote_url(vote, format: :json)
end
