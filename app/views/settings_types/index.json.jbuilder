json.array!(@settings_types) do |settings_type|
  json.extract! settings_type, :id, :description, :internal_symbol
  json.url settings_type_url(settings_type, format: :json)
end
