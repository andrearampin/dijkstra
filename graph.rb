class Graph
  attr_reader :nodes

  def initialize
    @nodes = {}
  end

  def add_node(node)
    @nodes[node.value] = node
  end

  def add_edge(node1, node2, weight)
    @nodes[node1.value].add_edge(@nodes[node2.value], weight)
    @nodes[node2.value].add_edge(@nodes[node1.value], weight)
  end

  def to_s
    @nodes.map do |key, node|
      node.to_s
    end.join("\n")
  end
end
