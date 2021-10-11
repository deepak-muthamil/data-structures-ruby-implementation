class CircularQueue
  attr_accessor :queue, :length, :front_index, :rear_index

  DEFAULT_QUEUE_SIZE = 5

  def initialize(length = DEFAULT_QUEUE_SIZE)
    @queue = Array.new(length)
    @length = length
    @front_index = @rear_index = -1
  end

  def enqueue(element)
    @rear_index = (@rear_index + 1) % @length
    @queue[@rear_index] = element
    @queue
  end

  def dequeue
    raise 'Queue is empty' if @front_index == @rear_index

    @front_index = (@front_index + 1) % @length
    element = front
    @queue[@front_index] = nil
    element
  end

  def front
    @front_index == -1 ? nil : @queue[@front_index]
  end

  def rear
    @rear_index == -1 ? nil : @queue[@rear_index]
  end
end
