class CreateCustomerReservations < ActiveRecord::Migration
  def change
    create_table :customer_reservations do |t|
      t.integer :reservation_id
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
