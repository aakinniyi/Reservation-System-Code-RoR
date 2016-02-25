json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :flight_id
  json.url reservation_url(reservation, format: :json)
end
