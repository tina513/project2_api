class Flight < ActiveRecord::Base
  has_many :users, through: :trips
  has_many :trips
end
