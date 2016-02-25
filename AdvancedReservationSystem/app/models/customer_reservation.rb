class CustomerReservation < ActiveRecord::Base
	belongs_to :customer
	belongs_to :reservation
  
	validates :reservation_id, presence: true
	validates :customer_id, presence: true  
end
