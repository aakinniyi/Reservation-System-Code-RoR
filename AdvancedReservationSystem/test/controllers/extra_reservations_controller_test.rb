require 'test_helper'

class ExtraReservationsControllerTest < ActionController::TestCase
  setup do
    @extra_reservation = extra_reservations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:extra_reservations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create extra_reservation" do
    assert_difference('ExtraReservation.count') do
      post :create, extra_reservation: { : @extra_reservation., additionalinfo: @extra_reservation.additionalinfo, arrival_airport_id: @extra_reservation.arrival_airport_id, attraction_id: @extra_reservation.attraction_id, availability: @extra_reservation.availability, checkin: @extra_reservation.checkin, checkout: @extra_reservation.checkout, dayoftheweek: @extra_reservation.dayoftheweek, dayoftheweek: @extra_reservation.dayoftheweek, hotel_list_id: @extra_reservation.hotel_list_id, numberofguest: @extra_reservation.numberofguest, numberofpassanger: @extra_reservation.numberofpassanger, numberoftourist: @extra_reservation.numberoftourist, otherdestination: @extra_reservation.otherdestination, pickup: @extra_reservation.pickup, restaurant_id: @extra_reservation.restaurant_id, room: @extra_reservation.room, specialrequirement: @extra_reservation.specialrequirement, tour_id: @extra_reservation.tour_id, user_id: @extra_reservation.user_id, visitingdate: @extra_reservation.visitingdate }
    end

    assert_redirected_to extra_reservation_path(assigns(:extra_reservation))
  end

  test "should show extra_reservation" do
    get :show, id: @extra_reservation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @extra_reservation
    assert_response :success
  end

  test "should update extra_reservation" do
    patch :update, id: @extra_reservation, extra_reservation: { : @extra_reservation., additionalinfo: @extra_reservation.additionalinfo, arrival_airport_id: @extra_reservation.arrival_airport_id, attraction_id: @extra_reservation.attraction_id, availability: @extra_reservation.availability, checkin: @extra_reservation.checkin, checkout: @extra_reservation.checkout, dayoftheweek: @extra_reservation.dayoftheweek, dayoftheweek: @extra_reservation.dayoftheweek, hotel_list_id: @extra_reservation.hotel_list_id, numberofguest: @extra_reservation.numberofguest, numberofpassanger: @extra_reservation.numberofpassanger, numberoftourist: @extra_reservation.numberoftourist, otherdestination: @extra_reservation.otherdestination, pickup: @extra_reservation.pickup, restaurant_id: @extra_reservation.restaurant_id, room: @extra_reservation.room, specialrequirement: @extra_reservation.specialrequirement, tour_id: @extra_reservation.tour_id, user_id: @extra_reservation.user_id, visitingdate: @extra_reservation.visitingdate }
    assert_redirected_to extra_reservation_path(assigns(:extra_reservation))
  end

  test "should destroy extra_reservation" do
    assert_difference('ExtraReservation.count', -1) do
      delete :destroy, id: @extra_reservation
    end

    assert_redirected_to extra_reservations_path
  end
end
