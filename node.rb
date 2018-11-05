# frozen_string_literal: true

# Node
# Element of a Graph: https://en.wikipedia.org/wiki/Graph_(abstract_data_type)
class Node
  attr_reader :value, :adjacent_nodes

  # Intialise the node.
  # @param [Integer|String]
  # @return [Node]
  def initialize(value)
    @value = value
    @adjacent_nodes = {}
  end

  # Link the node to another nodem by defining the end node and the weight
  # for the link that connects the two.
  # @param [Node]
  # @param [Integer]
  # @return [Node]
  def add_edge(node, weight)
    @adjacent_nodes[node.value] = { weight: weight, node: node }
    self
  end

  # Convert the node to a readable format.
  # @return [String]
  def to_s
    edges = @adjacent_nodes.map do |node, payload|
      "#{node} (lw: #{payload[:weight]})"
    end.join(', ')
    "Node #{value} has adjacent nodes: #{edges}"
  end
end
