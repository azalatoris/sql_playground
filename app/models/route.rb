class Route < ApplicationRecord
  has_many :trips
  has_many :route_stops

  def self.most_trips  
    joins(:trips).group(:id).order("COUNT(trips.id) DESC").limit(1)
  end

  def self.most_tickets
    joins(trips: {sales: :tickets}).group(:id).order("COUNT(tickets.id) DESC").limit(1)
    # We usually order by our condition (ticket sold)
    # We usually group by what we look for (route in this case, hence routes.id)
  end

  
end

=begin
* Route with the most tickets sold : ROUTE - TRIP - SALE - TICKET
=end