void main() {
  Question1a question1a = Question1a();
  print(question1a.findPath(question1a.graph, 'A', 'C'));
}

class Question1a {
  Map graph = {
    'A': ['B', 'C', 'D'],
    'B': ['A', 'C', 'D'],
    'C': ['A', 'B', 'D'],
    'D': ['A', 'B', 'C']
  };

  findPath(Map graph, String source, String destination) {
    Set visited = {source};

    List<Set> allPath = [];

    List stack = [source];

    while (stack.isNotEmpty) {
      String currentNode = stack.removeLast();

      if (!(visited.contains(currentNode))) {
        visited.add(currentNode);
      }

      if (currentNode == destination) {
        while (currentNode == destination) {
          if (!(allPath.contains(visited))) {
            allPath.add(visited);
          }

          // Initializing value of visited back to source node
          visited = {source};
          if (stack.isNotEmpty) {
            currentNode = stack.removeLast();

            if (!(visited.contains(currentNode))) {
              visited.add(currentNode);
            }
          } else {
            return allPath;
          }
        }
      }

      for (String neighbour in graph[currentNode]) {
        if (!(visited.contains(neighbour))) {
          stack.add(neighbour);
        }
      }
    }
    return (allPath);
  }
}
