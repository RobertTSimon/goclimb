class RouteTrip < ApplicationRecord
  belongs_to :route
  belongs_to :trip
end
