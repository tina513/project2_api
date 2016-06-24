class FlightSerializer < ActiveModel::Serializer
  attributes :id, :flight_number, :departure_date, :departure_time, :departure, :arrival_date, :arrival_time, :arrival, :arrival_zipcode, :gate, :terminal, :users, :trips
end
