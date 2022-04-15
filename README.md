# README

Consider a basic bus ticketing system, a brief explanation of the domain follows:
* `Users` can act as both `passengers` for `Tickets` and `buyers` for `Sales`
* `BusModels` are relating certain type of `Seat` map to each `Bus`
* `Routes` are a collection of `Stops` ordered by `RouteStops`
* `Sales` have many `Tickets`, which assing a `Seat` to each `User` as passenger
* `Trips` are `Buses` traveling through a `Route`
* `Sales` only belong to one `Trip`

## Example Queries

* Trip with the most tickets sold
* Route with the most trips
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

WIP: add more ordered related stuff, more nested queries, et c.

https://www.yworks.com/yed-live/?file=https://gist.githubusercontent.com/vaporyhumo/178e1fa3fbc9ac90f514b24711248203/raw/8f3333309f0b52f58d10104c204a7ac8357a7744/sql-eval
