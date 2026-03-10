# Ada BFS Graph Project

This project is a simple implementation of the **Breadth-First Search (BFS)** algorithm in **Ada**.

The goal of the project is to model a graph in a clean and modular way, using Ada packages and generics:

- `Node_Pkg` defines a generic node type
- `Graph_Pkg` stores the graph structure using node IDs and adjacency lists
- `BFS_Pkg` implements the BFS traversal algorithm
- `Main` shows a complete example with nodes `1 .. 7`

## Project Idea

The design follows this philosophy:

- A **node** stores:
  - an `Id`
  - an `Element` of a generic type
- The **graph** is responsible for storing connections between nodes
- The **BFS algorithm** works on node IDs, not on the node contents themselves

This makes the graph and BFS logic independent from the actual type stored inside each node.

## Why This Design?

At first, it may seem natural to let each node store its own list of neighbors.  
However, this makes the graph strongly dependent on the node type.

In this version:

- `Node_Pkg` is generic because node contents may vary
- `Graph_Pkg` is independent from the node element type
- `BFS_Pkg` only needs the graph structure and node IDs

This separation makes the project easier to understand and extend.

## File Structure

```text
.
├── main.adb
├── node_pkg.ads
├── node_pkg.adb
├── graph_pkg.ads
├── graph_pkg.adb
├── bfs_pkg.ads
└── bfs_pkg.adb
