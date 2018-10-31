require_relative 'graph'
require_relative 'node'
require 'byebug'

g = Graph.new

node0 = g.add_node(Node.new(0))
node1 = g.add_node(Node.new(1))
node2 = g.add_node(Node.new(2))
node3 = g.add_node(Node.new(3))
node4 = g.add_node(Node.new(4))
node5 = g.add_node(Node.new(5))
node6 = g.add_node(Node.new(6))
node7 = g.add_node(Node.new(7))
node8 = g.add_node(Node.new(8))

g.add_edge(node0, node1, 4)
g.add_edge(node0, node7, 8)

g.add_edge(node1, node2, 8)
g.add_edge(node1, node7, 11)

g.add_edge(node2, node3, 7)
g.add_edge(node2, node8, 2)
g.add_edge(node2, node5, 4)

g.add_edge(node3, node4, 9)
g.add_edge(node3, node5, 14)

g.add_edge(node4, node5, 10)

g.add_edge(node5, node6, 2)

g.add_edge(node6, node7, 1)
g.add_edge(node6, node8, 6)

g.add_edge(node7, node8, 7)

puts g.to_s
