class Station

  attr_accessor :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << [train.nomber, train.type]
    train.current_station = @name
    print "A new #{@trains.last[1]} train nomber #{@trains.last[0]} arrived at the station."
  end

  def trains_list
    print "At this moment at the station #{@name} are the following trains"
    @trains.each {|train|
      puts "#{train[1].capitalize} train № #{train[0]}"
    }
  end

  def trains_list_by_type
    count = 0
    @trains.each do |train|
      count += 1 if train[1] == "passager"
    end
    print "Amount of passager trains is #{count}, amount of gruz trains is #{@trains.size - count}"
  end

  def send_train
    print "Inter the nomber of train leaving station: "
    nomber = gets.chomp.to_i
    @trains.delete_if {|train| train[0] == nomber}
  end

end





class Route

attr_accessor :way_station

  def initialize(start_station, final_station)
    @start_station = start_station.name
    @final_station = final_station.name
    @way_station = [start_station.name, final_station.name]
  end

  def add_station(station)
  	@way_station.insert(-2, station.name)
  	print "A new station #{station.name} added"
  end

  def delete_station
  	print "Inter the name of station you want to delete: "
  	name = gets.chomp
  	@way_station.delete_if {|station_name| station_name == name}
  end

end






class Train

  attr_accessor :speed, :carriage_amount, :nomber, :type, :current_station
  attr_reader :all_stations

  def initialize(nomber, type, carriage_amount)
    @nomber = nomber
    @type = type
    @carriage_amount = carriage_amount
    @speed = 0
  end

  def change_carriage_amount
    if @speed == 0
      print "Inter + if you want to add carriage and -if you want to unhooked carriages: "
      count = gets.chomp
      @carriage_amount += 1 if count == "+"
      @carriage_amount -= 1 if count == "-"
    end
  end

  def add_route(route)
    @all_stations = route.way_station
    @current_station = route.way_station[0]
  end

  def move_train
    print "Inter + to move to the next sataion and - to return to previous station: "
    choise = gets.chomp
    if ((@current_station == @all_stations[0]) & (choise == "-")) || ((@current_station == @all_stations[-1]) & (choise == "+"))
      print "There no station"
    else
      @current_station = @all_stations[@all_stations.index(@current_station) - 1] if choise == "-"
      @current_station = @all_stations[@all_stations.index(@current_station) + 1] if choise == "+"
    end
  end

  def return_near_station
    if @current_station == @all_stations[0]
      print "#{@all_stations[0]}, #{@all_stations[1]}"
    elsif @current_station == @all_stations[-1]
      print "#{@all_stations[-2]}, #{@all_stations[-1]}"
    else
      print "#{@all_stations[@all_stations.index(@current_station) - 1]}, #{@current_station}, #{@all_stations[@all_stations.index(@current_station) + 1]}"
    end
  end

end
