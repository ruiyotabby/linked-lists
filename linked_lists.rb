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
    if @head.nil?
      @head = value
      @tail = value
    end
    value.next_node = @head
    @head = value
  end
end

m = Node.new
