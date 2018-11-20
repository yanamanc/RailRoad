module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
  attr_accessor :instances
  
<<<<<<< HEAD
    def counter
      @instances ||= 0
      @instances += 1
    end 
    
=======
  def counter
    @instances ||= 0
    @instances += 1
  end 
>>>>>>> 56ae5756c4e6b1d708e6eb2b26cb8b54472359fa
  end

  module InstanceMethods
    extend ClassMethods
    def register_instance
      self.class.send :counter
    end
  end

end
