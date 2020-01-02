class Stack
  def initialize(max)
    @stack_array = []
    @max = max
  end

  def push
    if @stack_array.length == @max
      puts "Stack is full"
    else
      puts "enter the element"
      ele = gets.chomp
      @stack_array << ele
      puts "#{ele} added to stack"
    end
  end

  def pop
    if @stack_array.length == 0
      puts "There is no item to delete"
    else
      @stack_array = @stack_array - @stack_array[@stack_array.length - 1].to_a
      puts "Item deleted successfully"
    end
  end

  def top
    if @stack_array.length == 0
      puts "There are no items to display"
    else
      puts "Element in the top is #{@stack_array[@stack_array.length - 1]}"
    end
  end
  
  def size
    puts "size of stack is #{@stack_array.length}"
  end

  def is_full?
  end
  
end

puts "Enter the size of stack"
size = gets.chomp
stack = Stack.new(size)
while true
  puts "Select one of the following options"
  puts "push , pop, top, size or exit"
  type = gets.chomp
  case type
    when "push"
      stack.push
    when "pop"
      stack.pop
    when  "top"
      stack.top
    when "size"
      stack.size
    when "exit"
      exit
    else
      puts "Should be one of push , pop, top, size or exit"
  end
end