class Route

  attr_accessor :stations
  extend InstanceCounter

  def initialize(start_station, final_station)
    @stations = [start_station, final_station]
    self.register_instance

  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

end
