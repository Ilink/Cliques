# todo avoid conversions between strings and ints for hash accessors
# todo avoid conversions back and forth between sets and arrays

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
# This code currently rests on the assumption that the set with the largest intersection is the best to start making a clique with. This is not entirely the case, and I need to correct it...
#
# @param _graph
# A hash of arrays, keyed by vertex number. EG:
#   "1" => [0,1,3]
# The above would represent vert 1 and its connections to verts 0, 1 and 3.
#
# @param chosen
# The vertex number(int) of the selected vertex

def max_clique(chosen, _graph)
  graph = _graph

  #puts "HERE HER EHERE" if chosen == 8


  clique = Set.new
  intersections = {}
  chosen_set = graph[chosen].to_set

  #print "chosen set: ", chosen_set.inspect, "\n"
  graph[chosen].each do |potential|
    # this set conversion is more convenient (for set operations), but probably not very fast
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
    y.size <=> x.size
  }
  intersections.reverse! # I have NO idea why doing x.size <=> y.size doesn't revers the values, but it doesn't
  #print 'intersections: ', intersections, "\n" if chosen == 0

  prev_intersection = nil
  # todo elaborate on this step: account for candidates nodes which are the same size. If they are the same size, I need to create a routine to explore which one is best.
  intersections.each do |intersection|
    intersection_set = intersection[1].to_set # inefficient!

    unless prev_intersection.nil?
      if intersection.size == prev_intersection.size

        prev_intersection = intersection
      end
    end

    if intersection_set.intersection(clique) == clique or intersection_set.superset?(clique)
      clique.add(intersection[0])
    end
    #print "candidate: ", intersection_set.inspect, "\tclique: ", @clique.inspect, "\n"

  end

  clique.add(chosen.to_s) # add the selected node itself
  clique.to_a
end

def remove_keys(arr, hash)
  arr.each do |val|
    hash.delete(Integer(val))
  end
  hash
end

# @function all_max_cliques(graph)
# First, we sort the graph. The first node, should therefore have the most number of connections.
# The basic idea here is:
#   1. Find maximum clique in graph
#   2. Remove that clique's verts from the graph
#   3. Repeat until all verts have been removed
#
# Something is wrong and the order of the input matters. I don't know why. Is there a side effect from the max_clique function?

def all_max_cliques(_graph)
  cliques = []
  graph = _graph

  #until graph.empty?
    largest_clique = []
    graph.each do |vert|
      clique = max_clique(vert[0], graph)
      print 'cliqueeee', clique, "\n"
      #print 'cliqueeee', clique, "\t", vert, "\n"
      if clique.size > largest_clique.size
        #print "largest clique was: ", largest_clique, "\t New clique: ", clique, "\n"
        largest_clique = clique
      end
    end
    cliques.push(largest_clique)
    print "largest clique!: ", largest_clique, "\n"

    #graph = remove_keys(largest_clique, graph)
  #end
  print cliques, "\n"

end