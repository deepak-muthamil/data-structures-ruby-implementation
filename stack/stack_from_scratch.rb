class Stack
  attr_accessor :stack

  def initialize(stack = [])
    @stack = stack
  end

  def push(value)
    @stack.push(value)
  end

  def pop
    @stack.pop
  end

  def length
    @stack.length
  end

  def top
    @stack.last
  end

  alias size length
  alias peek top
end

