class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :flight_number
      t.date :departure_date
      t.time :departure_time
      t.string :departure
      t.date :arrival_date
      t.time :arrival_time
      t.string :arrival
      t.integer :arrival_zipcode
      t.string :gate
      t.string :terminal

      t.timestamps null: false
    end
  end
end
