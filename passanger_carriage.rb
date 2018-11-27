class PassangerCarriage < Carriage

  attr_reader :free_seats, :occupied_seats, :type

  def initialize(seats_number)
    @type = "passanger"
    @free_seats = seats_number
    @occupied_seats = 0
  end

  def take_seat
    @free_seats -= 1 && @occupied_seats +=1 if @free_seats > 0
  end

end
