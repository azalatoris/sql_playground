class Trip < ApplicationRecord
  belongs_to :bus
  belongs_to :route

  has_many :sales
  has_many :tickets, through: :sales
end
