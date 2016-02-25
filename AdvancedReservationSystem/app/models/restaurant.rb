class Restaurant < ActiveRecord::Base
  
	has_many :extra_reservations, class_name: "ExtraReservation"
  
end
