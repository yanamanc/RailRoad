module Accessors

  def attr_accessor_with_history(*args)
    args.each do |argument|
      argument_history = "@#{argument}_history".to_sym
      argument_value = "@#{argument}".to_sym

      define_method("#{argument}=") do |value|
        instance_variable_set(argument_history, []) if instance_variable_get(argument_history) == nil
        instance_variable_get(argument_history) << instance_variable_get(argument_value) if instance_variable_get(argument_history) != nil
        instance_variable_set(argument_value, value)
      end

      define_method("#{argument}_history") do
        instance_variable_get(argument_history)
      end

      define_method(argument) do
        instance_variable_get(argument_value)
      end
    end
  end

  def strong_attr_accessor(attr_name, class_name)
    define_method("#{attr_name}=") do |value|
      raise ArgumentError, 'Error' if class_name != value.class

      instance_variable_set("@#{attr_name}", value)
    end

    define_method(attr_name) do
      instance_variable_get("@#{attr_name}")
    end
  end
end
