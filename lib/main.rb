# Linked list is a basic data structure consisting of nodes.
class LinkedList
  attr_accessor :head_node

  def initialize(head_node = nil)
    @head_node = head_node
  end

  def append(value)
    if @head_node
      find_tail.next_node = Node.new(value)
    else
      @head_node = Node.new(value)
    end
  end

  def find_tail
    current_node = @head_node
    return current_node unless current_node.next_node

    return current_node unless current_node.next_node while (current_node = current_node.next_node)
  end

  def prepend(value)
    if @head_node
      new_head_node = Node.new(value)
      new_head_node.next_node = @head_node
      @head_node = new_head_node
    else
      @head_node = Node.new(value)
    end
  end

  def size
    i = @head_node ? 1 : 0
    current_node = @head_node
    while current_node.next_node
      i += 1
      current_node = current_node.next_node
    end
    i
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
our_linked_list.prepend('this is a second node\'s value!')

puts our_linked_list.head_node.value
puts our_linked_list.head_node.next_node.value
our_linked_list.append('third')
puts our_linked_list.head_node.next_node.value
our_linked_list.append('fourth')
our_linked_list.append('five')
puts our_linked_list.size