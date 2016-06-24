class Trip < ActiveRecord::Base
  belongs_to :user, inverse_of: :trips
  belongs_to :flight, inverse_of: :trips
end
