class PassangerTrain < Train

  attr_accessor :carriages, :type, :speed

  def initialize(number)
    @speed = 0
    @type = "passanger"
    @number = number
    @carriages = []
  end

end
