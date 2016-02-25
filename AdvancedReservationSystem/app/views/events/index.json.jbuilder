json.array!(@events) do |event|
  json.extract! event, :id, :name, :eventdate, :arrival_airport_id, :description, :price, :eventimage
  json.url event_url(event, format: :json)
end
