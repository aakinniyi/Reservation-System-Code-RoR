class Customer < ActiveRecord::Base 
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :address, presence: true
	
	has_many :reservations, through: :customer_reservations
	has_many :customer_reservations
	has_many :flights, through: :reservations	
end
