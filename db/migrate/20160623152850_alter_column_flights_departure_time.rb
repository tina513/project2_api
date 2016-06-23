class AlterColumnFlightsDepartureTime < ActiveRecord::Migration
  def self.up
    change_table :flights do |t|
      t.change :departure_time, :string
      t.change :arrival_time, :string
    end
  end
  def self.down
    change_table :flights do |t|
      t.change :departure_time, :time
      t.change :arrival_time, :time
    end
  end
end
