void main() {
  Question1b question1b = Question1b();
  print(question1b.findShortest(question1b.graph, 'A', 'H'));
}

class Question1b {
  Map graph = {
    'A': ['B', 'D', 'H'],
    'B': ['A', 'C', 'D'],
    'C': ['B', 'D', 'F'],
    'D': ['A', 'B', 'C', 'E'],
    'E': ['D', 'F', 'H'],
    'F': ['C', 'E', 'G'],
    'G': ['F', 'H'],
    'H': ['A', 'E', 'G']
  };

  findShortest(Map graph, String source, String destination) {
    // Passing nodeA into constructor of Set
    // Initial node will be 'A'
    Set visited = {
      [source]
    };

    // name of node and distance from source. Initial will be ['A', 0]
    List queue = [
      [source, 0]
    ];

    while (queue.isNotEmpty) {
      // Breadth first method is applied. Hence, first element is removed from the list
      List current = queue.removeAt(0);

      // current[0] means current node, i.e. nodeA
      // If the current node is equal to nodeB, we have our shortest distance
      if (current[0] == destination)
        return ("Shortest path between $source and $destination is " +
            current[1].toString()); // printing distance path
      // Using for loop neighbour in nodeA
      for (String neighbour in graph[current[0]]) {
        if (!visited.contains(neighbour)) {
          visited.add(neighbour);
          queue.add([neighbour, current[1] + 1]);
        }
      }
    }
  }
}
