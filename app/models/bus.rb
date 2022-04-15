class Bus < ApplicationRecord
  belongs_to :bus_model
  has_many :trips
end
