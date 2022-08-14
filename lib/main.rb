# Linked list is a basic data structure consisting of nodes.
class LinkedList
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  def append(value)
    if @head
      tail.next_node = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  def tail
    current_node = @head
    return current_node unless current_node.next_node

    return current_node unless current_node.next_node while (current_node = current_node.next_node)
  end

  def prepend(value)
    if @head
      new_head = Node.new(value)
      new_head.next_node = @head
      @head = new_head
    else
      @head = Node.new(value)
    end
  end

  def size
    i = @head ? 1 : 0
    current_node = @head
    while current_node.next_node
      i += 1
      current_node = current_node.next_node
    end
    i
  end

  def at(index)
    current_node = @head
    while index.positive?
      return 'Exceeded length' unless current_node.next_node

      current_node = current_node.next_node
      index -= 1
    end
    current_node
  end

  def pop
    if @head.next_node
      self.at(self.size - 2).next_node = nil
    else
      @head = nil
    end
  end

  def contains?(value)
    current_node = @head
    while current_node.next_node
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = @head
    index = 0
    while current_node.next_node
      return index if current_node.value == value

      index += 1 
      current_node = current_node.next_node
    end
    nil
  end

  def to_s
    result = ''
    current_node = @head
    while current_node.next_node
      result << " (#{current_node.value}) ->" 
      current_node = current_node.next_node
    end
    result << "(#{self.tail.value})"
  end
# 0 1 2 3 4 === 2? === 0 1 {} 2 3 4 === 0 1 2 3 4 5 
  def insert_at(value, index)
    return false if index > self.size - 1

    predecessor = self.at(index - 1)
    current_occupier = self.at(index)
    newcomer = Node.new(value)
    newcomer.next_node = current_occupier
    predecessor.next_node = newcomer
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

puts our_linked_list.head.value
puts our_linked_list.head.next_node.value
our_linked_list.append('third')
puts our_linked_list.head.next_node.value
our_linked_list.append('fourth')
our_linked_list.append('five')
puts our_linked_list.size

node_at_index_3 = our_linked_list.at(3)
puts node_at_index_3.value

puts 'before insert'
puts our_linked_list.to_s
puts 'after insert at 2 '
our_linked_list.insert_at('inserted value', 2)
puts our_linked_list.to_s