class CargoTrain < Train

  attr_accessor :carriages, :type, :speed

  def initialize(number)
    @speed = 0
    @type = "cargo"
    @number = number
    @carriages = []
  end

end
