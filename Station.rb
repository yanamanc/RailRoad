class Station

  attr_accessor :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
    train.current_station = @name
    print "A new #{@trains.last.type} train nomber #{@trains.last.nomber} arrived at the station."
  end

  def trains_list
    @trains.each {|train|
      "#{train.type}, #{train.nomber}"
    }
  end

  def trains_list_by_type(type)
    @trains.each { |train|
      train.nomber if train.type == type
    }
  end

  def send_train(train)
    @trains.delete(train)
  end

end
