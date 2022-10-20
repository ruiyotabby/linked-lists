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

  def initialize
    @head = nil
    @tail = nil
  end

  def prepend(value)
    unless value.class == Node
      node = Node.new
      node.data = value
    end
    node = value if value.class == Node
    if @head.nil?
      @tail = node
    else
      node.next_node = @head
    end
    @head = node
  end

  def append(value)
    unless value.class == Node
      node = Node.new
      node.data = value
    end
    node = value if value.class == Node
    if @tail.nil?
      @head = node
    else
      @tail.next_node = node
    end
    @tail = node
  end

  def size
    node = @head
    count = 0
    until node.nil?
      node = node.next_node
      count += 1
    end
    count
  end

  def at(index)
    return nil if index > size

    count = 0
    node = @head
    loop do
      count += 1
      node = node.next_node
      return node if count == index
    end
  end

  def pop
    node = @head
    loop do
      return nil if node.nil?

      if node.next_node == @tail
        @tail = node
        @tail.next_node = nil
        break
      end
      node = node.next_node
    end
  end

  def contains?(value)
    node = @head
    until node.nil?
      return true if node.data == value

      node = node.next_node
    end
    false
  end

  def find(value, index = 0, node = @head)
    return nil if node.nil?
    return index if node.data == value

    find(value, index + 1, node.next_node)
  end

  def to_s(node = @head)
    print "( #{node.data} ) -> "
    return print "( #{node.data} ) -> nil" if node == @tail

    to_s(node.next_node)
  end
end

m = Node.new
m.data = 4
n = Node.new
n.data = 6
# m.next_node = n
k = Node.new
k.data = 234
# n.next_node = k
L = LinkedList.new
L.prepend(m)
L.append(n)
L.append(566)
L.prepend(10)
L.append(k)
p L.size
p L.find(566)
puts L
