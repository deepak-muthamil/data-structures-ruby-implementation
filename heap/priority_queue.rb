class PriorityQueueNode 
  attr_accessor :value, :priority

  def initialize(value, priority, position)
    @value = value 
    @priority = priority
    @position = position
  end

  def left_child_position
    (position + 1) * 2
  end

  def right_child_position
    left_child_position + 1
  end

  def parent_position
    (position - 1)/2
  end
end

class PriorityQueue < Array

  # structure of values in array  [value, priority]
  # 0 is higher priority than 1
  alias top first
  def push(value, priority)
    super(PriorityQueueNode.new(value, priority, size - 1))
    bubble_up
  end

  def pop
    top_element = top
    self[0] = last
    super
    bubble_down
  end

  def bubble_up(position = size - 1)
    return if position.zero?

    unless valid_node_position?(position)
      self[position], self[parent(position)] = self[parent(position)], self[position]
      bubble_up(parent(position)) 
    end
  end

  def bubble_down(position = 0)
    low_priority_position = position
    right_child_position = ( position + 1 ) * 2 
    low_priority_position = (( position + 1 ) * 2 ) - 1
  end

  def parent(position)
    (position - 1)/2
  end

  def valid_node_position?(position)
    self[position][1] > self[parent(position)][1]
  end
end
