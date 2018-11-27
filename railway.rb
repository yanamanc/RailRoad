class Railway
  attr_accessor :passanger_trains, :cargo_trains, :routes, :allstations

  def initialize
    @passanger_trains = []
    @cargo_trains = []
    @routes = []
    @allstations = []
  end

  def menu
    loop do
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

      choose = gets.chomp.to_i

      case choose
      when 0
        break

      when 1
        puts '1 - passanger train'
        puts '2 - cargo train'
        choose1 = gets.chomp.to_i
        begin
          puts 'input number'
          number = gets.chomp
          case choose1
          when 1
            @passanger_trains << PassangerTrain.new(number)
            puts "Passanger train number #{number} was created"
          when 2
            puts 'input volume'
            volume = gets.chomp.to_i
            @cargo_trains << CargoTrain.new(number)
            puts "Cargo train number #{number} was created"
            end
        rescue RuntimeError => e
          puts e.message
          retry
        end

      when 2
        begin
          puts 'Inter name of Station'
          name = gets.chomp
          @allstations << Station.new(name)
        rescue RuntimeError => e
          puts e.message
          retry
        end
      when 3
        puts 'Inter name of first and last station'
        first_station = gets.chomp
        last_station = gets.chomp
        first_station_search = @allstations.select { |station| station.name == first_station }.first
        last_station_seach = @allstations.select { |station| station.name == last_station }.first
        @routes << Route.new(first_station_search, last_station_seach)

      when 4
        puts 'Inter name of first and last station'
        first_station = gets.chomp
        last_station = gets.chomp
        puts 'Inter name of station you want to add'
        station = gets.chomp
        route = @routes.select { |route| route.stations[0] == first_station && route.stations[-1] == last_station }.first
        route.stations.insert(1, @allstations.select { |st| st.name == station }.first)

      when 5
        puts 'Inter name of first and last station'
        first_station = gets.chomp
        last_station = gets.chomp
        puts 'Inter name of station you want to delete'
        station = gets.chomp
        route = @routes.select { |route| route.stations[0].name == first_station && route.stations[-1].name == last_station }.first
        route.sub_station(@allstations.select { |station| station.name == station }.first)

      when 6
        puts '1 - add to passanger train'
        puts '2 - add to cargo train'
        choose = gets.chomp.to_i
        puts 'Inter number of train'
        number = gets.chomp
        puts 'Inter name of first station'
        first_station = gets.chomp
        puts 'Inter name of last station'
        last_station = gets.chomp
        route = @routes.select { |route| route.stations[0].name == first_station && route.stations[-1].name == last_station }.first
        case choose
        when 1
          train = @passanger_trains.select { |train| train.number == number }.first
          train.add_route(route)
          @allstations.select { |station| station.name == first_station }.first.trains << train
        when 2
          train = @cargo_trains.select { |train| train.number == number }.first
          train.add_route(route)
          @allstations.select { |s| s.name == first_station }.first.trains << train
          end

      when 7
        puts '1 - add to passanger train'
        puts '2 - add to cargo train'
        choose = gets.chomp.to_i
        puts 'Inter number of train'
        number = gets.chomp
        case choose
        when 1
          puts 'input seats amount'
          seats = gets.chomp.to_i
          @passanger_trains.select { |train| train.number == number }.first.add_carriage(PassangerCarriage.new(seats))
        when 2
          puts 'input total volume'
          volume = gets.chomp.to_i
          @cargo_trains.select { |train| train.number == number }.first.add_carriage(CargoCarriage.new(volume))
        end

      when 8
        puts '1 - delete from passanger train'
        puts '2 - delete from cargo train'
        choose = gets.chomp.to_i
        puts 'Inter nomber of train'
        number = gets.chomp
        case choose
        when 1
          @passanger_trains.select { |train| train.number == number }.first.sub_carriage
        when 2
          @cargo_trains.select { |train| train.number == number }.first.sub_carriage
        end

      when 9
        puts '1 - passanger train'
        puts '2 - cargo train'
        choose = gets.chomp.to_i
        puts 'Inter nomber of train'
        number = gets.chomp
        case choose
        when 1
          train = @passanger_trains.select { |train| train.number == number }.first
          train.move_to_next_station
        when 2
          train = @cargo_trains.select { |train| train.number == number }.first
          train.move_to_next_station
        end

      when 10
        puts '1 - add to passanger train'
        puts '2 - add to cargo train'
        choose = gets.chomp.to_i
        puts 'Inter nomber of train'
        number = gets.chomp
        case choose
        when 1
          train = @passanger_trains.select { |train| train.number == number }
          train = train.first.move_to_previous_station
        when 2
          train = @cargo_trains.select { |train| train.number == number }
          train = train.first.move_to_previous_station
        end

      when 11
        puts 'Inter name of first and last station'
        first_station = gets.chomp
        last_station = gets.chomp
        route = @routes.select { |route| route.stations[0].name == first_station && route.stations[-1].name == last_station }
        route.first.stations

      when 12
        puts '=======Passanger trains======='
        @passanger_trains.each do |train|
          train.carriages_list do |carriage|
            puts "passanger carriages №#1, free seats : #{carriage.seats_number},
             occupied seats amount: #{carriage.occupied_seats}."
          end
        end
        puts '=======Cargo trains======='
        @cargo_trains.each do |train|
          train.carriages_list do |carriage|
            puts "cargo carriages №#2, free volume: #{carriage.total_volume},
             occupiedvolume: #{carriage.occupied_volume}."
          end
        end

      when 13
        @allstations.each do |station|
          puts "=======#{station.name}======="
          station.trains_list do |train|
            puts "#{train.type} train №#{train.number},
             carriges amount:  #{train.carriages.size}."
          end
        end

      when 14
        puts 'Inter number of cargo train'
        number = gets.chomp
        puts 'Inter volume in ur carriage'
        volume = gets.chomp.to_i
        train = @cargo_trains.select { |train| train.number == number }
        train = train.first.carriages
        cargo_carriage = train.select { |carriage| carriage.total_volume == volume }.first
        puts 'Occupie volume value: '
        new_volume = gets.chomp.to_i
        cargo_carriage.take_up_volume(new_volume)

      when 15
        puts 'Inter number of passanger train'
        number = gets.chomp
        puts 'Inter seats amount in ur carriage'
        seats = gets.chomp.to_i
        train = @passanger_trains.select { |train| train.number == number }.first.carriages
        passanger_carriage = train.select { |carriage| carriage.seats_number == seats }.first
        passanger_carriage.take_seat
      end
    end
  end
end
