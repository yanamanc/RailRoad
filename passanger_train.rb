class PassangerTrain < Train

  attr_accessor :type, :speed, :number
  include InstanceCounter

  def initialize(nomber)
    @speed = 0
    @type = "passanger"
    @number = number
    @@array << self
    register_instance
  end

end
