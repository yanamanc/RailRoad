class PassangerTrain < Train

  attr_accessor :type, :speed, :number
  include InstanceCounter

  def initialize(number)
    @speed = 0
    @type = "passanger"
    @number = number
    @@array << self
    register_instance
    validate!
  end

end
