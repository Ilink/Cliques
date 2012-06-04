class Graph
  def initialize
    @graph = {}
  end

  attr_reader :graph

  def insert(node, connections)
    connections_set = connections.to_set
    if @graph.has_key? node
      @graph[node].merge(connections)
    else
      @graph[node] = connections_set
    end

    connections.each do |connection|
      if @graph.has_key? connection
        @graph[connection].add(node)
      else
        @graph[connection] = [node].to_set
      end
    end
  end

  def inspect
    @graph.each do |node|
      node
    end
  end

  private


end