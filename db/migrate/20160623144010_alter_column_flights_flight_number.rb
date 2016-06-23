class AlterColumnFlightsFlightNumber < ActiveRecord::Migration
  def self.up
    change_table :flights do |t|
      t.change :flight_number, :string
    end
  end
  def self.down
    change_table :flights do |t|
      t.change :flight_number, :integer
    end
  end
end
