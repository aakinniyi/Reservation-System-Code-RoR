class ExtraReservation < ActiveRecord::Base
  belongs_to :arrival_airport, class_name: "Airport"
  belongs_to :hotel_list, class_name: "HotelList"
  belongs_to :tour, class_name: "Tour"
  belongs_to :attraction, class_name: "Attraction"
  belongs_to :restaurant, class_name: "Restaurant"    
  belongs_to :user
        
end
