module InstanceCounter

	@@instances = 0
  
  def instances
    puts "In that class #{ @@instances } instances"
  end

  protected

  def self.register_instance
    @@instances += 1
  end

end
