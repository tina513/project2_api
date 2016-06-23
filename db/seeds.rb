# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Flight.create([
  { flight_number: 'UA345', departure_date: '2016-06-23', departure_time: '11:05', departure: 'New York City', arrival_date: '2016-06-23', arrival_time: '12:55', arrival: 'Chicago', arrival_zipcode: 60666, gate: 'C9', terminal: 'B'},
  { flight_number: 'UA689', departure_date: '2016-06-23', departure_time: '17:15', departure: 'New York City', arrival_date: '2016-06-23', arrival_time: '19:05', arrival: 'Chicago', arrival_zipcode: 60666, gate: 'C11', terminal: 'B'},
  { flight_number: 'WN325', departure_date: '2016-06-23', departure_time: '13:25', departure: 'Atlanta', arrival_date: '2016-06-23', arrival_time: '15:20', arrival: 'Oakland', arrival_zipcode: 94621, gate: 'C6', terminal: 'S'}
])
