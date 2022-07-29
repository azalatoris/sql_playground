class RouteStop < ApplicationRecord
  belongs_to :route
  belongs_to :stop  
  
  def self.passed_tickets
    joins(route: {trips: {sales: :tickets}})
      .where.not(order: 1)
      # where order not last
      .where("route_stops.\"order\" < (SELECT route_stops.\"order\" FROM route_stops WHERE route_stops.route_id = routes.id ORDER BY route_stops.\"order\" DESC LIMIT 1)")
      # `WHERE route_stops.route_id = routes.id` -- selecting only the route stops from the same route
      .group(:id)
      .order("COUNT(tickets.id) DESC")
      .first

    # Route.most_tickets.first.route_stops.find_by(order: 2).stop
  end
end

=begin
* Stops with the most tickets that passed through: ROUTESTOP - ROUTE - TRIP - SALE - TICKET
=end
