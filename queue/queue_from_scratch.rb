class QueueDs
  attr_accessor :queue

  def initialize(queue = [])
    @queue = queue
  end

  def enqueue(element)
    @queue.push(element)
  end

  def dequeue
    @queue.shift
  end

  def front
    @queue.first
  end

  def rear
    @queue.last
  end
end

queue = QueueDs.new([1,2,3,4,5])
puts queue.front
puts queue.queue.to_s
puts queue.enqueue(10).to_s
puts queue.queue.to_s
puts queue.dequeue
puts queue.queue.to_s

