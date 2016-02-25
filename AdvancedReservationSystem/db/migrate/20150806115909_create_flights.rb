class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :airline_id
      t.integer :departure_airport_id
      t.integer :arrival_airport_id
      t.datetime :departure_date
      t.integer :duration
      t.float :price
      t.string :availability

      t.timestamps null: false
    end
  end
end
