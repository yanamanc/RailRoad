class Train

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
    @carriage_amount -= 1 if @speed == 0
  end

  def add_route(route)
    @all_stations = route.stations
    @current_station = route.stations[0]
  end

  def move_to_next_station
    if @current_station == @all_stations[-1]
      print "There no station"
    else
      @current_station = @all_stations[@all_stations.index(@current_station) + 1]
    end
  end

  def move_to_previous_station
    if @current_station == @all_stations[0] 
      print "There no station"
    else
      @current_station = @all_stations[@all_stations.index(@current_station) - 1]
    end
  end

  def return_near_station
    if @current_station == @all_stations[0]
      "#{@all_stations[0]}, #{@all_stations[1]}"
    elsif @current_station == @all_stations[-1]
       "#{@all_stations[-2]}, #{@all_stations[-1]}"
    else
      "#{@all_stations[@all_stations.index(@current_station) - 1]}, #{@current_station}, #{@all_stations[@all_stations.index(@current_station) + 1]}"
    end
  end

end
