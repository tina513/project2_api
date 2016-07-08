class TripSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :flight_id
  has_one :user
  has_one :flight
end
