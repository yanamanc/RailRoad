class PassangerTrain < Train

  attr_accessor :type, :speed, :number
  include InstanceCounter

  @@instances = 0

  def initialize(nomber)
    @speed = 0
    @type = "passanger"
    @number = number
    @@array << self
    @@instances = register_instance(@@instances)
  end

end
