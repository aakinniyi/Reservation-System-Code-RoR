class CreateExtraReservations < ActiveRecord::Migration
  def change
    create_table :extra_reservations do |t|
      t.string :user_id
      t.string :hotel_list_id, :default => "Not Specified", :null => true
      t.string :room
      t.datetime :checkin
      t.datetime :checkout
      t.string :availability
      t.string :arrival_airport_id, :default => "Not Specified", :null => true
      t.string :otherdestination
      t.datetime :pickup
      t.integer :numberofpassanger
      t.string :attraction_id, :default => "Not Specified", :null => true
      t.string :dayoftheweek
      t.string :tour_id, :default => "Not Specified", :null => true
      t.string :dayoftheweek
      t.integer :numberoftourist
      t.string :restaurant_id, :default => "Not Specified", :null => true
      t.datetime :visitingdate
      t.integer :numberofguest
      t.string :specialrequirement
      t.text :additionalinfo

      t.timestamps null: false
    end
  end
end
