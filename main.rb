require_relative 'firm.rb'
require_relative 'valid.rb'
require_relative 'instance_counter.rb'
require_relative 'carriage.rb'
require_relative 'cargo_carriage.rb'
require_relative 'passanger_carriage.rb'
require_relative 'train.rb'
require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'cargo_train.rb'
require_relative 'passanger_train.rb'
require_relative 'railway.rb'

rail_way = Railway.new
rail_way.menu

=begin
s1 = Station.new("Minsk")
s2 = Station.new("Zhlobin")
s3 = Station.new("Bobruisk")
r = Route.new(s1, s2)
r.add_station(s3)
p = PassangerTrain.new("hsd-12")
p.add_route(r)
=end
