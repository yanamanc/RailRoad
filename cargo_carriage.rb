class CargoCarriage < Carriage

  attr_reader :type, :free_volume, :occupied_volume

  def initialize(volume)
    @type = "cargo"
    @free_volume = volume
    @occupied_volume = 0
  end

  def take_up_volume(value)
    @free_volume -= value && @occupied_volume += value if @free_volume > @free_volume - value
  end

end
