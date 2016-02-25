class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin_user!, :except => [:index]

  # GET /flights
  # GET /flights.json
  def index
    #@flights = Flight.all
    @airports = Airport.all.map do |a| 
      [a.name, a.id]
    end
    @airlines = Airline.all.map do |al| 
      [al.name, al.id]
    end
    @dates = Flight.date_list
    @customer_options = [1,2,3,4,5,6,7,8,9]
    @departure_airport = params[:departure_airport_id]
    @destination_airport = params[:arrival_airport_id]
    @depart_date = params[:departure_date]
    @customers = params[:customers]
    #@airlines = params [:airline_id]

    @flights = Flight.search(params[:departure_airport_id],
    params[:arrival_airport_id],
    params[:airline_id],
    params[:departure_date])	 	
    if params[:commit] == "Search"
      if params[:departure_airport_id] == params[:arrival_airport_id]
        flash[:danger] = "Your Departure Airport and Arrival Airport Should not be the Same"	
      end
    end
  end

  # GET /flights/1
  # GET /flights/1.json
  # def show
  # end
  #
  # # GET /flights/new
  # def new
  #   @flight = Flight.new
  # end
  #
  # # GET /flights/1/edit
  # def edit
  # end
  #
  # # POST /flights
  # # POST /flights.json
  # def create
  #   @flight = Flight.new(flight_params)
  #
  #   respond_to do |format|
  #     if @flight.save
  #       format.html { redirect_to @flight, notice: 'Flight was successfully created.' }
  #       format.json { render :show, status: :created, location: @flight }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @flight.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # PATCH/PUT /flights/1
  # # PATCH/PUT /flights/1.json
  # def update
  #   respond_to do |format|
  #     if @flight.update(flight_params)
  #       format.html { redirect_to @flight, notice: 'Flight was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @flight }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @flight.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /flights/1
  # # DELETE /flights/1.json
  # def destroy
  #   @flight.destroy
  #   respond_to do |format|
  #     format.html { redirect_to flights_url, notice: 'Flight was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  #
  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_flight
  #     @flight = Flight.find(params[:id])
  #   end
  #
  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def flight_params
  #     params.require(:flight).permit(:airline_id, :departure_airport_id, :arrival_airport_id, :departure_date, :duration, :price, :availability)
  #   end
end
