# Linked list is a basic data structure consisting of nodes.
class LinkedList
  attr_accessor :head_node

  def initialize(head_node = nil)
    @head_node = head_node
  end

  def append(value)
    if @head_node
      @head_node.next_node = Node.new(value)
    else
      @head_node = Node.new(value)
    end
  end
end

# Node is a basic data structure that stores a value and a pointer to the
# next node.
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

our_linked_list = LinkedList.new
our_linked_list.append('this is a head node\'s value')
our_linked_list.append('this is a second node\'s value!')

puts our_linked_list.head_node.value
puts our_linked_list.head_node.next_node.value