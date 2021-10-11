class PriorityQueue
  def initialize
    @queue = [nil]
    @size = 0
  end

  def add(element)
    @queue.push(element)
    @size += 1
    bubble_up(@size)
    # print @queue
  end

  def valid_parent?(element, parent_element)
    element > parent_element
  end

  def bubble_up(position)
    parent_position = position / 2
    return if parent_position <= 0

    is_valid_parent = valid_parent?(@queue[position], @queue[parent_position])
    return if is_valid_parent

    @queue[parent_position], @queue[position] = @queue[position], @queue[parent_position]
    bubble_up(parent_position)
  end

  def peek
    @queue[1]
  end

  def pop_element
    top_element = peek
    @queue[1] = @queue[@size]
    @queue.pop
    @size -= 1
    bubble_down(1)
    puts @queue.to_s
    puts top_element
  end

  def bubble_down(position)
    return if position > @size

    next_possible_position = position
    next_possible_position = position * 2 if valid_move?(position * 2, next_possible_position)
    next_possible_position = (position * 2) + 1 if valid_move?((position * 2) + 1, next_possible_position)
    return if next_possible_position == position

    @queue[next_possible_position],  @queue[position] = @queue[position], @queue[next_possible_position]
    bubble_down(next_possible_position)
  end

  def valid_move?(next_position, current_position)
    return false if next_position > @size

    # valid_parent?(@queue[next_position], @queue[current_position])
    @queue[next_position] < @queue[current_position]
  end
end

pq = PriorityQueue.new
10.downto(1) do |element| 
  pq.add(element)
end

10.times { pq.pop_element }