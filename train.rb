class Train
  attr_accessor :current_station
  attr_reader :stations
  include Firm
  include Validation
  include InstanceCounter
  extend Accessors

  NUMBER_FORMAT = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i.freeze

  @@array = []

  def initialize(number)
    @speed = 0
    @number = number
    @@array << self
    @carriages = []
    @stations = []
    set_type
    register_instance
    validate!
  end

  def self.all_instances
    @@array
  end

  def self.find(number)
    @@array.select { |train| train.number == number }
  end

  def add_carriage(carriage)
    @carriages << carriage if @speed.zero? && @type == carriage.type
  end

  def sub_carriage
    @carriages.delete_at(0) if @speed.zero?
  end

  def speed(number)
    @speed += number
  end

  def add_route(route)
    @stations = route.stations
    @current_station = route.stations[0].name
  end

  def stop
    @speed = 0
  end

  def next_station
    @stations[@stations.index(@current_station) + 1] if current_station?
  end

  def previous_station
    @stations[@stations.index(@current_station) - 1] if current_station?
  end

  def move_to_next_station
    @current_station = @next_station
  end

  def move_to_previous_station
    @current_station = @previous_station
  end

  def carriages_list
    @carriages.each { |carriage| yield(carriage) }
  end

  protected

  def current_station?
    !@current_station == @all_stations[0]
  end

  def validate!
    raise 'Number is not correct' if number !~ NUMBER_FORMAT

    true
  end
end
