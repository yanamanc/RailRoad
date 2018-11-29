class CargoTrain < Train
  attr_accessor :number, :type, :speed, :carriages

  def set_type
    @type = 'cargo'
  end
end
