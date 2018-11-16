class PassangerTrain < Train

  attr_accessor :type, :speed, :nomber
  extend InstanceCounter

  def initialize(nomber)
    @speed = 0
    @type = "passanger"
    @nomber = nomber
    @@array << self
    self.register_instance
  end

end
