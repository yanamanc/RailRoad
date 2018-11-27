class Train

  attr_accessor :current_station
  attr_reader :all_stations
  include Firm
  include Valid
  include InstanceCounter

  NUMBER_FORMAT = /^[a-z0-9]{3}[-]{0,1}[a-z0-9]{2}$/i

  @@array = []

  def self.all_instances
    @@array
  end

  def self.find(number)
    @@array.select{ |train| train.number == number}
  end

  def add_carriage(carriage)
    @carriages << carriage if @speed == 0 && self.type == carriage.type
  end

  def sub_carriage
    @carriages.delete_at(0) if @speed == 0
  end

  def speed(number)
    @speed += number
  end

  def add_route(route)
    @all_stations = route.stations
    @current_station = route.stations[0]
  end

  def stop
    @speed = 0
  end

  def next_station
    @all_stations[@all_stations.index(@current_station) + 1] if @current_station != @all_stations[-1]
  end

  def previous_station
    @all_stations[@all_stations.index(@current_station) - 1] if @current_station != @all_stations[0]
  end

  def move_to_next_station
    @current_station = self.next_station
  end

  def move_to_previous_station
    @current_station = self.previous_station
  end

  def carriages_list
    @carriages.each { |carriage| yield(carriage) }
  end

  protected

  def validate!
    raise "Number is not corrent" if number !~ NUMBER_FORMAT
    true
  end

end

