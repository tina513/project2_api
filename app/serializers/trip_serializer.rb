class TripSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :flight
end
