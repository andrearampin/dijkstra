# frozen_string_literal: true

# Graph
# https://en.wikipedia.org/wiki/Graph_(abstract_data_type)
class Graph
  # Intialise the graph.
  # @return [Gragh]
  def initialize
    @nodes = {}
    @path = []
    @pool = []
    @values_in_path = []
  end

  # Add a new node to the graph.
  # @param [Node]
  # @return [Node]
  def add_node(node)
    nodes[node.value] = node
  end

  # Add a new link between two graph nodes.
  # @param [Node]
  # @param [Node]
  # @param [Integer]
  # @return [Graph]
  def add_edge(node1, node2, weight)
    nodes[node1.value].add_edge(nodes[node2.value], weight)
    nodes[node2.value].add_edge(nodes[node1.value], weight)
    self
  end

  # Convert the graph to a readable format.
  # @return [String]
  def to_s
    nodes.map do |_key, node|
      node.to_s
    end.join("\n")
  end

  # Execute Dijkstra's shortest path algorithm.
  # @return [Array]
  def dijkstra
    # Intialise the algorithom if first run
    init_dijkstra if empty_path?

    # Stop the execution if all the nides have been reached
    return path if completed_path?

    # Make sure that all the weights are updated
    current_node[:node].adjacent_nodes.values.each do |node|
      @pool << node.merge(
        from: current_node[:node],
        weight: node[:weight] + current_node[:weight]
      )
    end

    # Sort the pool of nodes/edges by weight so to be able to grab the smallest
    # weight.
    pool.sort_by! { |edge| edge[:weight] }

    # Pick the next untouched node by shifting the nodes in the pool starting
    # from the smallest to the greatest.
    next_node = nil
    loop do
      next_node = pool.shift
      break unless values_in_path.include?(next_node[:node].value)
    end

    # Push the next step (from -> to) in the path
    @path << "#{next_node[:from].value} ==> #{next_node[:node].value}"

    # Track the node as seen
    @values_in_path += [next_node[:node].value, current_node[:node].value]

    # Update the current node
    @current_node = next_node

    # Keep the execution going
    dijkstra
  end

  private

  attr_accessor :nodes, :path, :pool, :current_node, :values_in_path

  # Verify if all the nodes have been "touched" and there is a path between
  # them.
  # @return [Boolean]
  def completed_path?
    path.size == nodes.size - 1
  end

  # Verify if the Dijkstra's is empty.
  # @return [Boolean]
  def empty_path?
    path.empty?
  end

  # initialize the Dijkstra's algorithm.
  def init_dijkstra
    _key, node = nodes.first
    @current_node = { node: node, weight: 0, from: node }
  end
end
