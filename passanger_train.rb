class PassangerTrain < Train
  attr_accessor :type, :speed, :number, :carriages

  def initialize(number)
    @speed = 0
    @type = 'passanger'
    @number = number
    @@array << self
    @carriages = []
    register_instance
    validate!
  end
end
