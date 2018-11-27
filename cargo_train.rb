class CargoTrain < Train
  attr_accessor :number, :type, :speed, :carriages

  def initialize(number)
    @speed = 0
    @type = 'cargo'
    @number = number
    @@array << self
    @carriages = []
    register_instance
    validate!
  end
end
