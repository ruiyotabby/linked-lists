# This is a linked nodes object
class Node
  attr_accessor :data, :next_node

  def initialize
    @data = nil
    @next_node = nil
  end
end

# This object contains the list to the linked list
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def prepend(value)
    if @head.nil?
      @head = value
      @tail = value
    else
      value.next_node = @head
      @head = value
    end
  end

  def append(value)
    if @tail.nil?
      @head = value
      @tail = value
    else
      @tail.next_node = value
      @tail = value
    end
  end
end

m = Node.new
m.data = 4
L = LinkedList.new
L.prepend(m)
print L.tail.data
