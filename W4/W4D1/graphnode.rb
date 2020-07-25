require 'set'
require 'byebug'

class GraphNode
    attr_accessor :neighbors, :value
    def initialize(val)
        @value = val
        @neighbors = []
    end
end

def bfs(starting_node, target_value)
    queue = [starting_node]
    visited = Set.new([])
    while !queue.empty?
        current_node = queue[0]
        if visited.include?(current_node)
            queue.shift
            next
        end
        return current_node if current_node.value == target_value
        visited << current_node
        # debugger
        queue += current_node.neighbors
        queue.shift
    end
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")
p bfs(a, "f")