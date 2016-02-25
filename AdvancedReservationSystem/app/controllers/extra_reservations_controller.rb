class ExtraReservationsController < InheritedResources::Base
  before_action :set_reservation, only: [:show, :update, :edit, :destroy]
  before_action :authenticate_user!
	before_filter :authenticate_admin_user!, :only=> [:edit, :destroy]
  
  
  def index
    @extra_reservations = ExtraReservation.where(:user_id => current_user) 
  end
  
  def new
    @extra_reservation = ExtraReservation.new
  end
  
  def create   
    @extra_reservation = ExtraReservation.new(extra_reservation_params)
    @extra_reservation.user_id = current_user.id if current_user
    respond_to do |format|
      if @extra_reservation.save
        # redirect_to extra_steps_path
        format.html { redirect_to extra_steps_path(:id => "taxi", :extra_reservation_id => @extra_reservation.id) }
        format.json { render json: @extra_reservation, status: :created, location: @extra_reservation }
      else
        format.html { render :new }
        format.json { render json: @extra_reservation .errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
  end
  
  def show
    @extra_reservation = ExtraReservation.find(params[:id])
  end

  private
  
  
  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @extra_reservation = ExtraReservation.find(params[:id])
  end

    def extra_reservation_params
      params.require(:extra_reservation).permit(:user_id, :hotel_list_id, :room, :checkin, :checkout, :availability, :arrival_airport_id, :otherdestination, :pickup, :numberofpassanger, :attraction_id, :dayoftheweek, :tour_id, :dayoftheweek, :numberoftourist, :restaurant_id, :visitingdate, :numberofguest, :specialrequirement, :additionalinfo)
    end
end

