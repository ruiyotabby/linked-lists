require_relative 'linked_lists'

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
p L
puts L
L.insert_at(12, 2)
p 'hh'
# p L.head
p L
L.remove_at(0)
p 'hh'
p L
p L.size
