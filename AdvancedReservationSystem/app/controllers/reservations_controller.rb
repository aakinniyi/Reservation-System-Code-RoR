class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_admin_user!, :except => [:index]
  before_action :authenticate_user!
  

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.where(:user_id => current_user)   
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @reservation = Reservation.find(params[:id])
  end

  # GET /reservations/new
  def new
    @flight = Flight.find(params[:flight_id])
    @reservation = Reservation.new
    params[:customers].to_i.times { @reservation.customers.build }
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id if current_user
    if @reservation.save
      @reservation.customers.each do |p|
        CustomerMailer.thank_you(p).deliver
      end
      redirect_to new_extra_reservation_path # (@extra_reservation)
      flash[:success] = "Your Flight has been successfully Reserved."
    else
      @flight = Flight.find(params[:flight_id])
      render 'new'
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to new_flight_path, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:flight_id, customers_attributes: [:id, :name, :email, :address])
    end
end
