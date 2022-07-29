class User < ApplicationRecord
  has_many :sales
  has_many :tickets

  scope :been_through_stop, ->(stop_id, start_date, end_date) do
    joins(tickets: {sale: {trip: {route: {route_stops: :stop}}}})
      .select("users.*, COUNT(tickets.id) AS passes_count")
      .where(stops: {id: stop_id})
      .where(trips: {created_at: (start_date..end_date)})
      .group(:id).order(passes_count: :desc)
  end

  def self.most_seats
    joins(tickets: :seat).group(:id).order("COUNT(seats.id) DESC").limit(1)
  end

  def self.last_seat(user_id)
    joins(tickets: :seat)
      .select("seats.label")
      .where(:id => user_id)
      .order(created_at: :desc)
      .limit(1)
  end

  def self.most_sales
    joins(:sales).group(:id).order("COUNT(sales.id) DESC").limit(1)
  end

  def self.most_trips_b
    joins(sales: :trip).group(:id).order("COUNT(trip_id) DESC").limit(1)
  end

  def self.most_trips_p
    joins(tickets: {sale: :trip}).group(:id).order("COUNT(trip_id) DESC").limit(4)
  end

  def self.most_tickets_p
    joins(:tickets).group(:id).order("COUNT(tickets.id) DESC").limit(1)
  end

  def self.most_tickets_b
    joins(sales: :tickets).group(:id).order("COUNT(tickets.id) DESC").limit(1)
  end

  def self.biggest_amount
    joins(sales: :tickets).group(:id).order("SUM(amount) DESC").limit(1)
      # Not sure about this one 
  end

  def self.get_name(id)
    where(:id => id).first.name
  end
end




