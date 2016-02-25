ActiveAdmin.register Flight do
  
  active_admin_import
   
  permit_params :airline_id, :departure_airport_id, :arrival_airport_id, 
                :departure_date, :duration, :price, :availability

  config.sort_order = 'departureDate_asc'

  index do
    column "ID", :id
    column "Airline", :airline
    column "Departure Date", :departureDate
    column "Departure Airport", :departure_airport_id
    column "Arrival Airport", :arrival_airport_id
    column "Flight Duration", :duration
    column "Price", :price, :sortable => :price do |flight|
      div :class => "price" do
        number_to_currency flight.price, :unit => "£"
      end
    end
    column "Availability", :availability
    column "Created At", :created_at
    column "Updated At", :updated_at
    actions
  end

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
