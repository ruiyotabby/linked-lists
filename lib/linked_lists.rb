require_relative 'node'

# This object contains the list to the linked list
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def prepend(value)
    node = Node.new(value) unless value.class == Node
    node = value if value.class == Node
    if @head.nil?
      @tail = node
    else
      node.next_node = @head
    end
    @head = node
  end

  def append(value)
    node = Node.new(value) unless value.class == Node
    node = value if value.class == Node
    if @tail.nil?
      @head = node
    else
      @tail.next_node = node
    end
    @tail = node
  end

  def size(node = @head, count = 0)
    return count if node.nil?

    size(node.next_node, count + 1)
  end

  def at(index, count = 0, node = @head)
    return nil if index > size
    return node if count == index

    at(index, count + 1, node.next_node)
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

  def contains?(value, node = @head)
    return false if node.nil?
    return true if node.data == value

    contains?(value, node.next_node)
  end

  def find(value, index = 0, node = @head)
    return nil if node.nil?
    return index if node.data == value

    find(value, index + 1, node.next_node)
  end

  def to_s(node = @head)
    return print "( #{node.data} ) -> nil " if node == @tail

    print "( #{node.data} ) -> "
    to_s(node.next_node)
  end

  def insert_at(value, index, count = 0, node = @head)
    return 'Failed, the index is greater than the list size' if node.nil?

    return prepend(value) if index.zero?
    return append(value) if index == size

    if count + 1 == index
      new_node = Node.new(value)
      new_node.next_node = node.next_node
      return node.next_node = new_node
    end
    insert_at(value, index, count + 1, node.next_node)
  end

  def remove_at(index, node = @head, count = 0)
    return 'Failed' if node.nil?
    return pop if index == size
    return prepend(node.next_node.data) if index.zero?
    return node.next_node = node.next_node.next_node if index == count + 1

    remove_at(index, node.next_node, count + 1)
  end
end
