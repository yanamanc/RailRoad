class CargoCarriage < Carriage
  attr_reader :type, :total_volume, :occupied_volume

  def initialize(volume)
    @type = 'cargo'
    @total_volume = volume
    @occupied_volume = 0
  end

  def take_up_volume(value)
    @occupied_volume += value if @occupied_volume + value <= @total_volume
  end
end
