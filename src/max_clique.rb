# @function max_clique(chosen, graph)
# Finds the maximum clique in a graph. This uses a highly unoptimized brute-force method. This only works if you are passing in the node with the largest number of connections.
# There are several steps:
#   1. Visit every node within the graph
#   2. Calculate: visited node's connections ∩ chosen node's connections
#       a) These values are stored in a hash of arrays, indexed by the visited vertex's number
#   3. Sort the previously stored hash by largest number of mutual connections.
#   4. For each mutual connection, add it to the clique IFF it is a superset of the nodes within clique
#       a) Otherwise, you would wind up with nodes that are not mutually connected!
#
# @param graph
# A hash of arrays, keyed by vertex number. EG:
#   "1" => [0,1,3]
# The above would represent vert 1 and its connections to verts 0, 1 and 3.
#
# @param chosen
# The number of the selected

def max_clique(chosen, graph)
  #print "passed graph: ", chosen, "\t", graph, "\n"
  return [] if graph[chosen].nil?

  @clique = Set.new
  intersections = {}
  chosen_set = graph[chosen].to_set

  print "chosen set: ", chosen_set.inspect, "\n"
  graph[chosen].each do |potential|
    # this set conversion is more convenient, but probably not very fast
    # lets us do easy intersection calculations (such as intersection)
    potential_set = graph[Integer(potential)] # this is a really awkward way of doing this..
    print 'potential set: ', potential_set, "\n"

    # collect all intersections so we can sort by size
    # this represents the number of connections the chosen node shares with the visited node
    # the more connections, the better the candidate for a clique
    unless potential_set.nil?
      intersections[potential] = chosen_set.intersection(potential_set).to_a
    end
  end

  intersections = intersections.sort_by {|x,y|
    (y.size <=> x.size)
  }
  intersections.reverse! # I have NO idea why doing x.size <=> y.size doesn't revers the values, but it doesn't
  print 'intersections: ', intersections, "\n"

  intersections.each do |intersection|
    intersection_set = intersection[1].to_set # inefficient!
    print "candidate: ", intersection_set.inspect, "\tclique: ", @clique.inspect, "\n"
    if intersection_set.intersection(@clique) == @clique
      @clique.add(intersection[0])
    end
  end

  @clique.add(chosen.to_s) # add the selected node itself
  @clique.to_a
end

def remove_keys(arr, hash)
  arr.each do |val|
    hash.delete(Integer(val))
  end
  hash
end

def all_max_cliques(_graph)
  cliques = []
  graph = _graph

  until graph.empty?
  #graph.each do
    largest_clique = []
    graph.each do |vert|
      clique = max_clique(vert[0], graph)
      print 'cliqueeee', clique, "\t", vert, "\n"
      largest_clique = clique if clique.size > largest_clique.size
    end
    cliques.push(largest_clique)
    print "largest clique!: ", largest_clique, "\n"

    graph = remove_keys(largest_clique, graph)
  end
  print cliques, "\n"

end