require '.\factory.rb'
factory = Factory.new(:name, :age) do 
  def hello
    puts 'hello'
  end 
end

puts '-- Using --'
l_factory = factory.new('test',54)
puts '-- vars in class --'
puts l_factory.instance_variables
puts 'l_factory.name = '
puts l_factory.name
puts 'l_factory[\'name\'] = '
puts l_factory['name']
puts 'l_factory[:name] = '
puts l_factory[:name]
puts 'l_factory[0] = '
puts l_factory[0]

l_factory.hello
