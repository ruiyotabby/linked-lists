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
      @tail = value
    else
      value.next_node = @head
    end
    @head = value
  end

  def append(value)
    if @tail.nil?
      @head = value
    else
      @tail.next_node = value
    end
    @tail = value
  end

  def size
    num = @head
    i = 0
    while !num.nil?
      i += 1
      num = num.next_node
    end
    i
  end
end

m = Node.new
m.data = 4
n = Node.new
n.data = 6
m.next_node = n
k = Node.new
k.data = 234
n.next_node = k
L = LinkedList.new
L.prepend(m)
L.append(n)
# L.append(k)
# p L.head
p L.tail
# p L.size
