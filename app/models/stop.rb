class Stop < ApplicationRecord
  has_many :route_stops

  def self.most_initial_tickets
    joins(route_stops: {route: {trips: {sales: :tickets}}})
      .where("route_stops.\"order\" = 1")
      .order("COUNT(tickets.id) DESC")
      .group(:id)
      .limit(1)
  end

  def self.most_final_tickets
    joins(route_stops: {route: {trips: {sales: :tickets}}})
      .where("route_stops.\"order\" < (SELECT route_stops.\"order\" FROM route_stops WHERE route_stops.route_id = routes.id ORDER BY route_stops.\"order\" DESC LIMIT 1)")
      .order("COUNT(tickets.id) DESC")
      .group(:id)
      .limit(1)
  end
end


=begin
* * Stops with the most tickets as final stop of route
 STOP - ROUTESTOP - ROUTE - TRIP - SALE - TICKET
=end