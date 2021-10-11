class QueueDs < Array
  # reusing array functions - push, length, size
  alias enqueue push
  alias dequeue shift
  alias front first
  alias rear last
end

# using QueueDs class to avoid conflict incase Queue class is already defined in ruby source code
queue = QueueDs.new([1,2,3,4,5])
puts queue.front
puts queue.to_s
puts queue.enqueue(10).to_s
puts queue.to_s
puts queue.dequeue.to_s
puts queue.to_s
