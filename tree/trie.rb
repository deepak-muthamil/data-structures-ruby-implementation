class TrieNode
  attr_accessor :children, :eos

  def initialize(eos: false)
    @children = {}
    @eos = eos # end of string
  end
end

class Trie
  attr_accessor :root

  def initialize
    @root = nil
  end

  def add_strings(strings)
    strings.each do |string| 
      add_string(string)
    end
  end

  def add_string(string)
    @root ||= TrieNode.new
    current = @root
    string.each_char do |char|
      current.children[char] ||= TrieNode.new
      current = current.children[char]
    end
    current.eos = true
  end

  def construct_strings(root = @root, prefix_so_far = '', strings = [])
    strings.push(prefix_so_far) if root.eos
    root.children.each do |char, child_node|
      construct_strings(child_node, prefix_so_far + char, strings)
    end
    strings
  end

  def search_prefix(prefix)
    current = @root
    prefix.each_char do |char|
      current = current.children[char]
      return [] unless current
    end
    construct_strings(current, prefix)
  end

end

trie = Trie.new 
trie.add_strings(["root","rat","raod","test","today","tomorrow"])
# print trie.construct_strings
print trie.search_prefix("to")