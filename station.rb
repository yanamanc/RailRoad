class Station

  attr_accessor :trains, :name
  include InstanceCounter

  @@all = []
  @@instances = 0

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @trains = []
    @@all << self
    @@instances = register_instance(@@instances)
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

end
