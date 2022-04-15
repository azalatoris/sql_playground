class Route < ApplicationRecord
  has_many :trips
  has_many :route_stops
end
