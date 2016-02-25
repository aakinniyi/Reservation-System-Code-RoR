ActiveAdmin.register Reservation do

  active_admin_import

  permit_params :flight_id, customers_attributes: [:id, :name, :email, :address]
  
  
  config.sort_order = 'flight_id_asc'

  index do
    column "ID", :id
    column "User ID", :user_id
    column "Flight Number", :flight_id

    column "Created At", :created_at
    column "Updated At", :updated_at
    actions
  end
  
  
  form do |f|
    f.inputs do
      f.input :user_id, label: 'User', :as => :select, :collection => User.all.map{|u| ["#{u.email}", u.id]}
      f.input :flight_id, label: 'Flight Number', :as => :select, :collection => Flight.all.map{|f| ["#{f.id}", f.id]}
    f.actions
   end
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
