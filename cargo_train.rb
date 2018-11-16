class CargoTrain < Train

  attr_accessor :carriages, :type, :speed
  extend InstanceCounter

  def initialize(number)
    @speed = 0
    @type = "cargo"
    @number = number
    @carriages = []
    @@array << self
    self.register_instance
  end

end
