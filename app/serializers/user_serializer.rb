#
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :flights, :trips
end
