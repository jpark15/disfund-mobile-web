json.array!(@items) do |item|
  json.extract! item, :id, :type_id, :name, :description, :cost
  json.url item_url(item, format: :json)
end
