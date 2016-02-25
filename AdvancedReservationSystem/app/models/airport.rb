class Airport < ActiveRecord::Base
	has_many :departing_flights, class_name: "Flight", foreign_key: "departure_airport_id"
	has_many :arriving_flights, class_name: "Flight", foreign_key: "arrival_airport_id"
	has_many :extra_reservations, class_name: "ExtraReservation"

  validates :name, presence: true	
	validates :code, presence: true
	validates :city, presence: true
  validates :country, presence: true
end
