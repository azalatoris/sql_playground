class BusModel < ApplicationRecord
  has_many :buses
  has_many :seats
end
