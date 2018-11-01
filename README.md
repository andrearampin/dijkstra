# Dijkstra's algorithm

Dijkstra's algorithm is an algorithm for finding the shortest paths between nodes in a graph, which may represent, for example, road networks. It was conceived by computer scientist Edsger W. Dijkstra in 1956 and published three years later.

For a given source node in the graph, the algorithm finds the shortest path between that node and every other. It can also be used for finding the shortest paths from a single node to a single destination node by stopping the algorithm once the shortest path to the destination node has been determined. For example, if the nodes of the graph represent cities and edge path costs represent driving distances between pairs of cities connected by a direct road, Dijkstra's algorithm can be used to find the shortest route between one city and all other cities. As a result, the shortest path algorithm is widely used in network routing protocols, most notably IS-IS (Intermediate System to Intermediate System) and Open Shortest Path First (OSPF).

## Algorithm

Let the node at which we are starting be called the **initial node**. Let the **distance of node Y** be the distance from the **initial node** to Y. Dijkstra's algorithm will assign some initial distance values and will try to improve them step by step

1. Mark all nodes unvisited. Create a set of all the unvisited nodes called the unvisited set.
1. Assign to every node a tentative distance value: set it to zero for our initial node and to infinity for all other nodes. Set the initial node as current.
1. For the current node, consider all of its unvisited neighbours and calculate their tentative distances through the current node. Compare the newly calculated tentative distance to the current assigned value and assign the smaller one. For example, if the current node A is marked with a distance of 6, and the edge connecting it with a neighbour B has length 2, then the distance to B through A will be 6 + 2 = 8. If B was previously marked with a distance greater than 8 then change it to 8. Otherwise, keep the current value.
1. When we are done considering all of the unvisited neighbours of the current node, mark the current node as visited and remove it from the unvisited set. A visited node will never be checked again.
1. If the destination node has been marked visited (when planning a route between two specific nodes) or if the smallest tentative distance among the nodes in the unvisited set is infinity (when planning a complete traversal; occurs when there is no connection between the initial node and remaining unvisited nodes), then stop. The algorithm has finished.
1. Otherwise, select the unvisited node that is marked with the smallest tentative distance, set it as the new "current node", and go back to step 3.

When planning a route, it is actually not necessary to wait until the destination node is "visited" as above: the algorithm can stop once the destination node has the smallest tentative distance among all "unvisited" nodes (and thus could be selected as the next "current").


*(ref: [Wikipedia](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm))*

## Execute

Test built using the following Graph

![](https://www.geeksforgeeks.org/wp-content/uploads/Fig-11.jpg)

In order to execute the algorithm

```
ruby main.rb
```

which will produce

```
Gragh Structure (lw = Link weight)
Node 0 has adjacent nodes: 1 (lw: 4), 7 (lw: 8)
Node 1 has adjacent nodes: 0 (lw: 4), 2 (lw: 8), 7 (lw: 11)
Node 2 has adjacent nodes: 1 (lw: 8), 3 (lw: 7), 8 (lw: 2), 5 (lw: 4)
Node 3 has adjacent nodes: 2 (lw: 7), 4 (lw: 9), 5 (lw: 14)
Node 4 has adjacent nodes: 3 (lw: 9), 5 (lw: 10)
Node 5 has adjacent nodes: 2 (lw: 4), 3 (lw: 14), 4 (lw: 10), 6 (lw: 2)
Node 6 has adjacent nodes: 5 (lw: 2), 7 (lw: 1), 8 (lw: 6)
Node 7 has adjacent nodes: 0 (lw: 8), 1 (lw: 11), 6 (lw: 1), 8 (lw: 7)
Node 8 has adjacent nodes: 2 (lw: 2), 6 (lw: 6), 7 (lw: 7)

Dijksta Path Structure
0 ==> 1
0 ==> 7
7 ==> 6
6 ==> 5
1 ==> 2
2 ==> 8
2 ==> 3
5 ==> 4
```

the representation of the output is

![](https://www.geeksforgeeks.org/wp-content/uploads/DIJ5.jpg)
