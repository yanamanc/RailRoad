class CargoTrain < Train

  attr_accessor :number, :type, :speed
  include InstanceCounter

  def initialize(number)
    @speed = 0
    @type = "cargo"
    @number = number
    @@array << self
    register_instance
    validate?
  end

end
