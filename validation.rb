module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  
  module ClassMethods
    attr_reader :validates

    def validate(attribute, type, args = {})
      @validates ||= []
      @validates << { attribute: attribute, type: type, args: args }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validates.each do |validation|
        value = instance_variable_get("@#{validation[:attribute]}")
        send("validate_#{validation[:type]}", value, *validation[:args])
      end
    end

    def valid?
      validate!
    rescue RuntimeError
      false
    end

    private

    def validate_presence(argument)
      raise ArgumentError, 'Error' if argument == nil
    end

    def validate_format(argument, format)
      raise ArgumentError, 'Error' if argument !~ format
    end

    def validate_type(argument,argument_class)
      raise ArgumentError, 'Error' unless argument.is_a?(argument_class)
    end
  end

end
