class CargoCarriage < Carriage

  attr_reader :type

  def initialize
    @type = "cargo"
  end

end
