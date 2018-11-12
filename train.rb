class Train2

  attr_accessor :speed, :carriage_amount, :nomber, :type, :current_station
  attr_reader :all_stations

  def initialize(nomber, type, carriage_amount)
    @nomber = nomber
    @type = type
    @carriage_amount = carriage_amount
    @speed = 0
  end

  def speed(number)
    @speed += number
  end

  def stop
    @speed = 0
  end

  def add_carriage
    @carriage_amount += 1 if @speed == 0
  end

  def sub_carriage
    @carriage_amount -= 1 if @speed == 0 && @carriage_amount != 0
  end

  def next_station
    @all_stations[@all_stations.index(@current_station) + 1] if @current_station != @all_stations[-1]
  end

  def previous_station
    @all_stations[@all_stations.index(@current_station) - 1] if @current_station != @all_stations[0]
  end

  def add_route(route)
    @all_stations = route.stations
    @current_station = route.stations[0]
  end

  def move_to_next_station
    @current_station = self.next_station
  end

  def move_to_previous_station
    @current_station = self.previous_station
  end

end
