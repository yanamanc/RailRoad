module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
  attr_accessor :instances
  
  def counter
    @instances ||= 0
    @instances += 1
  end 
  end

  module InstanceMethods
    extend ClassMethods
    def register_instance
      self.class.send :counter
    end
  end

end
