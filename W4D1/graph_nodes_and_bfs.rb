class GraphNode

    attr_accessor :val, :neighbors

    def initialize(val)
        @val = val
        @neighbors = []
    end

    def bfs(starting_node, target_value)
        
        @queue = [starting_node]
        visited = Set.new()

        until @queue.empty?
            current = @queue.shift
            if !visited.include?(current)
                return current if current.val == target_value
                visited.add(current)
                @queue += current.neighbors
            end
        end
        return nil
    end

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

    