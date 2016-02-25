class Flight < ActiveRecord::Base 
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  belongs_to :airline, class_name: "Airline"
  has_many :reservations
  # has_many :customers, through: :customer_reservations
  has_many :customers
  has_many :customer_reservations
  

  validates :departure_airport_id, presence: true
  validates :arrival_airport_id, presence: true
  validates :airline_id, presence: true
  validates :duration, presence: true
  validates :departure_date, presence: true
  validates :price, presence: true
  validates :availability, presence: true

  def self.date_list
    dates = Flight.all.order(departure_date: :asc)
    dates.map {|n| n.departure_date.strftime("%d/%m/%Y") }.uniq
  end

  def self.search(depart, arrive, airline, date)
    Flight.where(departure_airport_id: depart, 
    arrival_airport_id: arrive,
    airline_id: airline,
    departure_date: Flight.correct_date(date))
  end

  def self.correct_date(date)
    unless date.nil?
      date = date.to_date
      date.beginning_of_day..date.end_of_day
    end
  end	
end
