class Railway

  attr_accessor :passanger_trains, :cargo_trains, :routes, :allstations

  def initialize
    @passanger_trains = []
    @cargo_trains = []
    @routes = []
    @allstations = []
  end


  def menu

    while true
    puts "=============MENU============="
    puts "0 - Exit"
    puts "1 - Create new train"
    puts "2 - Create new station"
    puts "3 - Create new route"
    puts "4 - Add station to route"
    puts "5 - Delete station from route"
    puts "6 - Set route for train"
    puts "7 - Add carriage to train"
    puts "8 - Delete carriage from train"
    puts "9 - Move train to next station"
    puts "10 - Move train to previous station"
    puts "11 - Stations list"
    puts "12 - Trains list"

    choose = gets.chomp.to_i


    case choose
      when 0
        break

      when 1
        puts "1 - passanger train"
        puts "2 - cargo train"
        choose1 = gets.chomp.to_i

        case choose
          when 1
            puts "input nomber"
            nomber = gets.chomp.to_i
            @passanger_trains << PassangerTrain.new(nomber)
          when 2
            puts "input nomber"
            nomber = gets.chomp.to_i
            @cargo_trains << CargoTrain.new(nomber)
          end

      when 2
        puts "Inter name of Station"
        name = gets.chomp
        @allstations << Station.new(name)

      when 3
        puts "Inter name of first and last station"
        first_station = gets.chomp
        last_station = gets.chomp
        @routes << Route.new(@allstations.select{|station| station.name == first_station}, @allstations.select{|station| station.name == last_station})

      when 4
        puts "Inter name of first and last station"
        first_station = gets.chomp
        last_station = gets.chomp
        puts "Inter name of station you want to add"
        station = gets.chomp
        route = @routes.select{|route| route.stations[0] == first_station && route.stations[-1] == last_station}
        route.stations.insert(1, @allstations.select{|st| st.name == station})

      when 5
        puts "Inter name of first and last station"
        first_station = gets.chomp
        last_station = gets.chomp
        puts "Inter name of station you want to delete"
        station = gets.chomp
        route = @routes.select{|route| route.stations[0] == first_station && route.stations[-1] == last_station}
        route.sub_station(@allstations.select{|station| station.name == station})

      when 6
        puts "1 - add to passanger train"
        puts "2 - add to cargo train"
        choose = gets.chomp
        case choose

          when 1
            puts "Inter nomber of train"
            nomber = gets.chomp.to_i
            puts "Inter name of first station"
            first_station = gets.chomp
            puts "Inter name of last station"
            last_station = gets.chomp
            train = @passanger_trains.select{|train| train.nomber == nomber}
            train.add_route(@routes.select{|route| route.stations[0] == first_station && route.stations[-1] == last_station})

          when 2
            puts "Inter nomber of train"
            nomber = gets.chomp.to_i
            puts "Inter name of first station"
            first_station = gets.chomp
            puts "Inter name of last station"
            last_station = gets.chomp
            train = @cargo_trains.select{|train| train.nomber == nomber}
            train.add_route(@routes.select{|route| route.stations[0] == first_station && route.stations[-1] == last_station})
          end

      when 7
        puts "1 - add to passanger train"
        puts "2 - add to cargo train"
        choose = gets.chomp
        case choose
          when 1
            puts "Inter nomber of train"
            nomber = gets.chomp.to_i
            @passanger_trains.select{|train|train.nomber == nomber}.add_carriage(Passanger_carriage.new)

          when 2
            puts "Inter nomber of train"
            nomber = gets.chomp.to_i
            @cargo_trains.select{|train|train.nomber == nomber}.add_carriage(Cargo_carriage.new)
        end

      when 8
        puts "1 - delete from passanger train"
        puts "2 - delete from cargo train"
        choose = gets.chomp
        case choose

          when 1
            puts "Inter nomber of train"
            nomber = gets.chomp.to_i
            @passanger_trains.delete(stations.select{|station| station.name == station_del})

          when 2
            puts "Inter nomber of train"
            nomber = gets.chomp.to_i
            @cargo_trains.delete(stations.select{|station| station.name == station_del})
        end

      when 9
        puts "1 - passanger train"
        puts "2 - cargo train"
        choose = gets.chomp
        case choose

          when 1
            puts "Inter nomber of train"
            nomber = gets.chomp.to_i
            train = @passanger_trains.select{|train| train.nomber == nomber}
            train.move_to_next_station

          when 2
            puts "Inter nomber of train"
            nomber = gets.chomp.to_i
            train = @cargo_trains.select{|train| train.nomber == nomber}
            train.move_to_next_station
        end

      when 10
        puts "1 - add to passanger train"
        puts "2 - add to cargo train"
        choose = gets.chomp
        case choose

          when 1
            puts "Inter nomber of train"
            nomber = gets.chomp.to_i
            @passanger_trains.select{|train| train.nomber == nomber}.move_to_previous_station

          when 2
            puts "Inter nomber of train"
            nomber = gets.chomp.to_i
            @cargo_trains.select{|train| train.nomber == nomber}.move_to_previous_station
        end

      when 11
        puts "Inter name of first and last station"
        first_station = gets.chomp
        last_station = gets.chomp
        route = @routes.select{|route| route.stations[0] == first_station && route.stations[-1] == last_station}
        route.stations

      when 12
        puts "Inter name of station"
        station_name = gets.chomp
        station = @allstations.select{|station| station.name == station_name}
        station.trains

      end
    end
  end
end



