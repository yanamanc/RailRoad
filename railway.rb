class Railway
  attr_accessor :trains, :routes, :stations

  def initialize
    @trains = []
    @routes = []
    @stations = []
  end

  def menu
    loop do
      help

      choose = gets.chomp.to_i

      case choose
      when 0
        break
      when 1
        create_train
      when 2
        create_station
      when 3
        create_route
      when 4
        add_station
      when 5
        delete_station
      when 6
        set_route
      when 7
        add_carriage
      when 8
        delete_carriage
      when 9
        move_train_next
      when 10
        move_train_previous
      when 11
        station_list
      when 12
        carriages_list
      when 13
        trains_list
      when 14
        occupate_volume
      when 15
        occupied_seats
      end
    end
  end

  private

  def find_train(number, type)
    @trains.select { |train| train.number == number && train.type == type }.first
  end

  def find_station(name)
    @stations.select { |station| station.name == name }.first
  end

  def find_route(first, last)
    @routes.select { |route| route.stations[0].name == first && route.stations[-1].name == last }.first
  end

  def create_train
    puts '1 - passanger train'
    puts '2 - cargo train'
    choose1 = gets.chomp.to_i
    begin
        puts 'input number'
        number = gets.chomp
        case choose1
        when 1
          @trains << PassangerTrain.new(number)
          puts "Passanger train number #{number} was created"
        when 2
          @trains << CargoTrain.new(number)
          puts "Cargo train number #{number} was created"
        end
    rescue RuntimeError => e
      puts e.message
      retry
    end
  end

  def create_station
    puts 'Inter name of Station'
    name = gets.chomp
    @stations << Station.new(name)
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def create_route
    puts 'Inter name of first and last station'
    first_station = gets.chomp
    last_station = gets.chomp
    @routes << Route.new(find_station(first_station), find_station(last_station))
  end

  def add_station
    puts 'Inter name of first and last station'
    first_station = gets.chomp
    last_station = gets.chomp
    puts 'Inter name of station you want to add'
    station = gets.chomp
    route = find_route(first_station, last_station)
    route.stations.insert(1, find_station(station))
  end

  def delete_station
    puts 'Inter name of first and last station'
    first_station = gets.chomp
    last_station = gets.chomp
    puts 'Inter name of station you want to delete'
    station = gets.chomp
    route = find_route(first_station, last_station)
    route.sub_station(find_station(station))
  end

  def set_route
    puts '1 - add to passanger train'
    puts '2 - add to cargo train'
    choose = gets.chomp.to_i
    puts 'Inter number of train'
    number = gets.chomp
    puts 'Inter name of first station'
    first_station = gets.chomp
    puts 'Inter name of last station'
    last_station = gets.chomp
    route = find_route(first_station, last_station)
    case choose
    when 1
      train = find_train(number, 'passanger')
      train.add_route(route)
      find_station(first_station).trains << train
    when 2
      train = find_train(number, 'cargo')
      train.add_route(route)
      find_station(first_station).trains << train
    end
  end

  def add_carriage
    puts '1 - add to passanger train'
    puts '2 - add to cargo train'
    choose = gets.chomp.to_i
    puts 'Inter number of train'
    number = gets.chomp
    case choose
    when 1
      puts 'input seats amount'
      seats = gets.chomp.to_i
      find_train(number, 'passanger').add_carriage(PassangerCarriage.new(seats))
    when 2
      puts 'input total volume'
      volume = gets.chomp.to_i
      find_train(number, 'cargo').add_carriage(CargoCarriage.new(volume))
    end
  end

  def delete_carriage
    puts '1 - delete from passanger train'
    puts '2 - delete from cargo train'
    choose = gets.chomp.to_i
    puts 'Inter nomber of train'
    number = gets.chomp
    case choose
    when 1
      find_train(number, 'passanger').sub_carriage
    when 2
      find_train(number, 'cargo').sub_carriage
    end
  end

  def move_train_next
    puts '1 - passanger train'
    puts '2 - cargo train'
    choose = gets.chomp.to_i
    puts 'Inter nomber of train'
    number = gets.chomp
    case choose
    when 1
      find_train(number, 'passanger').move_to_next_station
    when 2
      find_train(number, 'cargo').move_to_next_station
    end
  end

  def move_train_previous
    puts '1 - add to passanger train'
    puts '2 - add to cargo train'
    choose = gets.chomp.to_i
    puts 'Inter nomber of train'
    number = gets.chomp
    case choose
    when 1
      find_train(number, 'passanger').move_to_previous_station
    when 2
      find_train(number, 'cargo').move_to_previous_station
    end
  end

  def station_list
    puts 'Inter name of first and last station'
    first_station = gets.chomp
    last_station = gets.chomp
    find_route(first_station, last_station).stations
  end

  def carriages_list
    @trains.each do |train|
      if train.type == 'passanger'
        puts "Passanger train №#{train.number}"
        train.carriages_list do |carriage|
          puts "passanger carriages №#1, free seats : #{carriage.seats_number - carriage.occupied_seats},
          occupied seats amount: #{carriage.occupied_seats}."
        end
      else
        puts "Cargo train №#{train.number}"
        train.carriages_list do |carriage|
          puts "cargo carriages №#2, free volume: #{carriage.total_volume},
          occupiedvolume: #{carriage.occupied_volume}."
        end
      end
    end
  end

  def trains_list
    @stations.each do |station|
      puts "=======#{station.name}======="
      station.trains_list do |train|
        puts "#{train.type} train №#{train.number},
          carriges amount:  #{train.carriages.size}."
      end
    end
  end

  def occupate_volume
    puts 'Inter number of cargo train'
    number = gets.chomp
    puts 'Inter volume in ur carriage'
    volume = gets.chomp.to_i
    train = find_train(number, 'cargo').carriages
    cargo_carriage = train.select { |carriage| carriage.total_volume == volume }.first
    puts 'Occupie volume value: '
    new_volume = gets.chomp.to_i
    cargo_carriage.take_up_volume(new_volume)
  end

  def occupied_seats
    puts 'Inter number of passanger train'
    number = gets.chomp
    puts 'Inter seats amount in ur carriage'
    seats = gets.chomp.to_i
    train = find_train(number, 'passanger').carriages
    passanger_carriage = train.select { |carriage| carriage.seats_number == seats }.first
    passanger_carriage.take_seat
  end

  def help
    puts '=============MENU============='
    puts '0 - Exit'
    puts '1 - Create new train'
    puts '2 - Create new station'
    puts '3 - Create new route'
    puts '4 - Add station to route'
    puts '5 - Delete station from route'
    puts '6 - Set route for train'
    puts '7 - Add carriage to train'
    puts '8 - Delete carriage from train'
    puts '9 - Move train to next station'
    puts '10 - Move train to previous station'
    puts '11 - Stations list'
    puts '12 - Show carriages list for all trains'
    puts '13 - Show trains list gor all stations'
    puts '14 - Occupie volume'
    puts '15 - Occupie seats'
  end

end
