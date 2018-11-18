module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  $count = 0

  module ClassMethods
    def instances
      $count
    end
  end

  module InstanceMethods
    def register_instance(instances)
    	instances += 1
    	$count = instances
    end
  end

end
