class Factory
  def self.new (*args, &block)
    Class.new do      
      attr_accessor( *args)  
      class_eval(&block) if block_given?
      define_method :initialize do |*values|
        @values = values        
        args.zip(values).each do |name, value|  
          send("#{name}=",value)
        end
      end
      def [](index)
        (index.is_a?Fixnum) ? @values[index] : send(index)
      end
    end
  end
end