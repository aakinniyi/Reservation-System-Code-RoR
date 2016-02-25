class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :eventdate
      t.string :arrival_airport_id
      t.text :description
      t.float :price

      t.timestamps null: false
    end
  end
end
