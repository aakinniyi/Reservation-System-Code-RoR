class CustomerMailer < ApplicationMailer
	def thank_you(customer)
    @customer = customer
    @from_location = @customer.reservations.last.flight.departure_airport.city
    @to_location = @customer.reservations.last.flight.arrival_airport.city

    mail(to: @customer.email, subject: "Thank You For Your Booking")
	end
end
