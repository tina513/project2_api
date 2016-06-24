#
class User < ActiveRecord::Base
  include Authentication
  has_many :examples
  has_many :flights, through: :trips
  has_many :trips
end
