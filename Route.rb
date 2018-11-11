class Route

attr_accessor :stations

  def initialize(start_station, final_station)
    @stations = [start_station.name, final_station.name]
  end

  def add_station(station)
    @stations.insert(-2, station.name)
    print "A new station #{station.name} added"
  end

  def delete_station(station)
    @stations.delete(station)
  end

end
