json.array!(@extra_reservations) do |extra_reservation|
  json.extract! extra_reservation, :id, :user_id, :hotel_list_id, :, :room, :checkin, :checkout, :availability, :arrival_airport_id, :otherdestination, :pickup, :numberofpassanger, :attraction_id, :dayoftheweek, :tour_id, :dayoftheweek, :numberoftourist, :restaurant_id, :visitingdate, :numberofguest, :specialrequirement, :additionalinfo
  json.url extra_reservation_url(extra_reservation, format: :json)
end
