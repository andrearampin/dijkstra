class Node
  attr_reader :value, :adjacent_nodes

  def initialize(value)
    @value = value
    @adjacent_nodes = {}
  end

  def add_edge(node, weight)
    @adjacent_nodes[node.value] = { weight: weight, node: node }
  end

  def to_s
    edges = @adjacent_nodes.map do |node, payload|
      "#{node} (#{payload[:weight]})"
    end.join(', ')
    "#{value}: #{edges}"
  end
end
