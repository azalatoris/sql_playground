class Trip < ApplicationRecord
  belongs_to :bus
  belongs_to :route

  has_many :sales
  has_many :tickets, through: :sales

  # def self.most_trips
  #   joins(:trips).group("trips.route_id").order("COUNT(trips.route_id)").limit(1)
  # end

  def self.most_tickets
    joins(sales: :tickets).group("trips.id").order("COUNT(tickets.id) desc").limit(1)
  end
end

=begin

Consider a basic bus ticketing system, a brief explanation of the domain follows:
* `Users` can act as both `passengers` for `Tickets` and `buyers` for `Sales`
* `BusModels` are relating certain type of `Seat` map to each `Bus`
* `Routes` are a collection of `Stops` ordered by `RouteStops`
* `Sales` have many `Tickets`, which assing a `Seat` to each `User` as passenger
* `Trips` are `Buses` traveling through a `Route`
* `Sales` only belong to one `Trip`

## Example Queries


* Route with the most tickets sold
* Stops with the most tickets that passed through
* Stops with the most tickets as initial stop of route
* Stops with the most tickets as final stop of route
* Users with the most trips as buyer/passenger
* Users with the most tickets as buyer/passenger
* Users with the most sales bought
* Users with the most total sales amount as buyer
* Every user that has been through a certain stop between certain dates ordered
  by the amount of times they passed
* Many more...

=end