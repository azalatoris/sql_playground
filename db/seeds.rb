# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create!(name: "Luke", movie: movies.first)


# User
# BusModel
# Seat
# Bus
# Stop
# Route
# RouteStop
#


10.times do
  name = Faker::Name.name
  email = Faker::Internet.email

  User.create!(name: name, email: email)
end
users = User.all

10.times do
  BusModel.create!(name: Faker::Cannabis.brand)
end

BusModel.find_each do |bus_model|
  30.times do |i|
    label = i
    Seat.create!(label: label, bus_model: bus_model)
  end
end

BusModel.find_each do |bus_model|
  5.times do
    Bus.create!(bus_model: bus_model, plate: Faker::Alphanumeric.alphanumeric(number: 10))
  end
end
buses = Bus.all

30.times do
  name = Faker::Name.name

  Stop.create!(name: name)
end

10.times do
  name = Faker::Name.name

  Route.create!(name: name)
end

Route.find_each do |route|
  stops = Stop.all.sample(10)

  10.times do |order|
    RouteStop.create!(route: route, stop: stops[order], order: order + 1)
  end
end

Route.find_each do |route|
  10.times do
    Trip.create!(route: route, date: Time.now, bus: buses.sample)
  end
end
trips = Trip.all

100.times do
  user = users.sample
  trip = trips.sample

  Sale.create!(user: user, trip: trip)
end
sales = Sale.all

1000.times do
  sale = sales.sample
  seat = sale.trip.bus.bus_model.seats.sample
  Ticket.create!(sale: sale, seat: seat, passenger: users.sample)
end
