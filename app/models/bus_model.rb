class BusModel < ApplicationRecord
  has_many :buses
  has_many :seats

  def self.most_seats
    joins(:seats).group(:id).order(seats_id: :desc).limit(5)
  end

  def self.with_most_tickets
    joins(seats: :tickets).group(:id).order("COUNT(tickets.id) DESC").limit(5)
  end

  def self.model_like(model)
    where("name LIKE ?", "%#{model}%")
  end
end
