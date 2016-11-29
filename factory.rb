class Factory
  def self.new (*args, &block)
    Class.new do      
      attr_accessor( *args)  
      class_eval(&block) if block_given?
      define_method(:initialize) do |*values|
        args.zip(values).each do |name, value|
          send("#{name}=",value)
        end
      end
      define_method(:[]) do |index|
        (index.is_a? Numeric) ? field = args[index] : field = index
        send(field)
      end
    end
  end
end