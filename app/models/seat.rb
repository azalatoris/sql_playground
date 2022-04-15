class Seat < ApplicationRecord
  belongs_to :bus_model
  has_many :tickets
end
