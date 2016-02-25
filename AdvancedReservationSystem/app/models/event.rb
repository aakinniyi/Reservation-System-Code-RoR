class Event < ActiveRecord::Base
  belongs_to :arrival_airport, class_name: "Airport"
 
  validates_presence_of :name, :description, :eventdate, :arrival_airport_id
    
  #Validte Date - must not be in the past
  validate :eventdate_cannot_be_in_the_past
  def eventdate_cannot_be_in_the_past
    if eventdate.present? && eventdate < Date.today
      errors.add(:eventdate, "Event can't be in the past, please check the date")
    end
  end
end
