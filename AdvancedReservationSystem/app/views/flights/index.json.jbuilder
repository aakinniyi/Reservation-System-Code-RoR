json.array!(@flights) do |flight|
  json.extract! flight, :id, :airline_id, :departure_airport_id, :arrival_airport_id, :departure_date, :duration, :price, :availability
  json.url flight_url(flight, format: :json)
end
