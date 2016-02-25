class Reservation < ActiveRecord::Base
	belongs_to :flight
  belongs_to :user
	has_many :customer_reservations
	has_many :customers, through: :customer_reservations

	validates :flight_id, presence: true

	accepts_nested_attributes_for :customers
  
end
