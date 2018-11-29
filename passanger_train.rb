class PassangerTrain < Train
  attr_accessor :type, :speed, :number, :carriages

  def set_type
    @type = 'passanger'
  end
end
