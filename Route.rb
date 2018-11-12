class Route

attr_accessor :stations

  def initialize(start_station, final_station)
    @stations = [start_station, final_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
    print "A new station #{station.name} added"
  end

  def delete_station(station)
    @stations.delete(station)
  end

end
