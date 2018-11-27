class PassangerCarriage < Carriage

  attr_reader :seats_number, :occupied_seats, :type

  def initialize(seats_number)
    @type = "passanger"
    @seats_number = seats_number
    @occupied_seats = 0
  end

  def take_seat
    @occupied_seats +=1 if @occupied_seats + 1 <= @seats_number
  end

end
