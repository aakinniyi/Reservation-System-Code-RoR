class Airline < ActiveRecord::Base  
  
	has_many :airports, class_name: "Flight", foreign_key: "airport_id"
  
  validates :name, presence: true	
	validates :iata, presence: true
	validates :icao, presence: true
  validates :callsign, presence: true
  validates :headquarters, presence: true
end
