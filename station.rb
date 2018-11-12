class Station

  attr_accessor :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
    train.current_station = self
  end

  def trains_list_by_type(type)
    @trains.select { |train|
      train.nomber if train.type == type
    }
  end

  def send_train(train)
    @trains.delete(train)
  end

end
