class TreeNode
  attr_accessor :value, :left, :right, :height

  def initialize(value)
    @value = value
    @height = 1
  end
end

class AvlTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(element)
    @root = insert_element(element, @root)
  end

  def insert_element(element, current_node)
    return new_node(element) unless current_node

    if current_node.value > element
      current_node.left = insert_element(element, current_node.left)
    elsif current_node.value < element
      current_node.right = insert_element(element, current_node.right)
    else
      raise 'Element already present'
    end
    update_height(current_node)
    balance_sub_tree(current_node, element)
    # current_node
  end

  def balance_sub_tree(current_node, element)
    factor = balance_factor(current_node)
    return rotate_right(current_node) if factor > 1 && current_node.left.value > element

    return rotate_left(current_node) if factor < -1 && current_node.right.value < element

    if factor > 1 && current_node.left.value < element
      current_node.left = rotate_left(current_node.left)
      return rotate_right(current_node)
    end
    if factor < -1 && current_node.right.value > element
      current_node.right = rotate_right(current_node.right)
      return rotate_left(current_node)
    end
    current_node
  end

  def rotate_left(root)
    new_root = root.right
    new_root_left = new_root.left
    new_root.left = root
    root.right = new_root_left
    update_height(root)
    update_height(new_root)
    new_root
  end

  def rotate_right(root)
    new_root = root.left
    new_root_right = new_root.right
    new_root.right = root
    root.left = new_root_right
    update_height(root)
    update_height(new_root)
    new_root
  end

  def update_height(root)
    root.height = 1 + height(root.left) + height(root.right)
  end

  def new_node(element)
    node = TreeNode.new(element)
    @root ||= node
    node
  end

  def balance_factor(node)
    node ? height(node.left) - height(node.right) : 0
  end

  def height(node)
    node ? node.height || 0 : 0
    # node.height || 0
  end

  def pre_order(root = @root)
    return unless root

    pre_order(root.left)
    print root.value, ' '
    pre_order(root.right)
  end
end

tree = AvlTree.new
[*1..3].shuffle.each do |element|
  tree.insert(element)
end
tree.pre_order

