class CargoTrain < Train

  attr_accessor :number, :type, :speed
  include InstanceCounter

  @@instances = 0

  def initialize(number)
    @speed = 0
    @type = "cargo"
    @number = number
    @@array << self
    @@instances = register_instance(@@instances)
  end

end
