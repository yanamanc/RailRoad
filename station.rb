class Station

  attr_accessor :trains
  attr_reader :name
  include InstanceCounter

  STATION_NAME_FORMAT = /^[a-z]+$/i

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @trains = []
    @@all << self
    register_instance
    validate!
  end

  def add_train(train)
    @trains << train
    train.current_station = self
  end

  def trains_list_by_type(type)
    @trains.select { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end

  def valid?
    validate!
    rescue RuntimeError
    false
  end

  private

  def validate!
    raise "Name of station must contain only leters" if name !~ STATION_NAME_FORMAT
    true
  end

end
