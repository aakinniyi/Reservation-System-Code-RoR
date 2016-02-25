class ExtraStepsController < ApplicationController
  
  include Wicked::Wizard
  
  steps :taxi, :touristattraction, :restaurant, :additionalinfo
  
  def show
    @extra_reservation = ExtraReservation.find(params[:extra_reservation_id])
    render_wizard   
  end
  
  def update
    @extra_reservation = ExtraReservation.find(params[:extra_reservation_id])
    @extra_reservation.update(extra_reservation_params)
    render_wizard @extra_reservation
  end 
  
  private
  
  def redirect_to_finish_wizard(options = nil)
    redirect_to extra_reservation_path (@extra_reservation), notice: "Thank you for using our service"
  end 

  def extra_reservation_params
    params.require(:extra_reservation).permit(:user_id, :hotel_list_id, :room, :checkin, :checkout, :availability, :arrival_airport_id, :otherdestination, :pickup, :numberofpassanger, :attraction_id, :dayoftheweek, :tour_id, :dayoftheweek, :numberoftourist, :restaurant_id, :visitingdate, :numberofguest, :specialrequirement, :additionalinfo)
  end
    
end
