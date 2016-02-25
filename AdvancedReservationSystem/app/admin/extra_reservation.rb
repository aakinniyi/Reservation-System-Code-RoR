ActiveAdmin.register ExtraReservation do
  
  permit_params :user_id, :hotel_list_id, :room, :checkin, :checkout, :availability, 
                :arrival_airport_id, :otherdestination, :pickup, :numberofpassanger, 
                :attraction_id, :dayoftheweek, :tour_id, :dayoftheweek, :numberoftourist, 
                :restaurant_id, :visitingdate, :numberofguest, :specialrequirement, 
                :additionalinfo

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
