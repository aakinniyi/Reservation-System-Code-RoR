ActiveAdmin.register Event do
  
  active_admin_import

  permit_params :price, :description, :arrival_airport_id, :eventdate, :name 

  config.sort_order = 'eventdate_asc'

  index do
    column "ID", :id
    column "Name", :name
    column "Date", :eventdate
    column "Location", :arrival_airport_id
    column "Description", :description
    column "Price", :price, :sortable => :price do |event|
      div :class => "price" do
        number_to_currency event.price, :unit => "£"
      end
    end
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
