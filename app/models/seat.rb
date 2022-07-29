class Seat < ApplicationRecord
  belongs_to :bus_model
  has_many :tickets

  def self.most_tickets
    joins(:tickets).group(:id).order("COUNT(tickets.id) DESC").limit(1)
  end
end

# Seat with most tickets
