class Bus < ApplicationRecord
  belongs_to :bus_model
  has_many :trips

  def self.most_trips
    joins(:trips).group(:id).order("COUNT(trips.id) DESC").limit(1)
  end

  def self.specific_stop(bus_stop)
    joins(trips: {route: :route_stops})
      .where(route_stops: {:id => bus_stop})
      .group(:id)
      .order(:id)
      .limit(10)
  end
end

