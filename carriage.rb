class Passanger_carriage

  include Firm

  def initialize
    @type = "passanger"
  end

end

class Cargo_carriage

  include Firm

  def initialize
    @type = "cargo"
  end

end
