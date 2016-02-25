require 'test_helper'

class FlightsControllerTest < ActionController::TestCase
  setup do
    @flight = flights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flight" do
    assert_difference('Flight.count') do
      post :create, flight: { airline_id: @flight.airline_id, arrival_airport_id: @flight.arrival_airport_id, availability: @flight.availability, departure_airport_id: @flight.departure_airport_id, departure_date: @flight.departure_date, duration: @flight.duration, price: @flight.price }
    end

    assert_redirected_to flight_path(assigns(:flight))
  end

  test "should show flight" do
    get :show, id: @flight
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flight
    assert_response :success
  end

  test "should update flight" do
    patch :update, id: @flight, flight: { airline_id: @flight.airline_id, arrival_airport_id: @flight.arrival_airport_id, availability: @flight.availability, departure_airport_id: @flight.departure_airport_id, departure_date: @flight.departure_date, duration: @flight.duration, price: @flight.price }
    assert_redirected_to flight_path(assigns(:flight))
  end

  test "should destroy flight" do
    assert_difference('Flight.count', -1) do
      delete :destroy, id: @flight
    end

    assert_redirected_to flights_path
  end
end
