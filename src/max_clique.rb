def max_clique(chosen, graph)
  print "passed graph: ", chosen, "\t", graph, "\n"
  return [] if graph[chosen].nil?
  # find biggest clique:
  @clique = [].to_set

  intersections = {}

  chosen_set = graph[chosen].to_set

  print "chosen set: ", chosen_set.inspect, "\n"
  graph[chosen].each do |potential|
    # this set conversion is more convenient, but probably not very fast
    # lets us do easy intersection calculations
    potential_set = graph[Integer(potential)] # this is a really awkward way of doing this..
    print 'potential set: ', potential_set, "\n"

    # collect all intersections so we can sort by size
    #unless potential_set.nil?
      intersections[potential] = chosen_set.intersection(potential_set).to_a
    #end
  end

  print 'intersections: ', intersections, "\n"

  intersections = intersections.sort_by {|x,y|
    #print 'comparison:', x.size, "\t", y.size, "\t", y.size <=> x.size, "\n"
    (y.size <=> x.size)
  }

  print 'intersections: ', intersections.reverse!, "\n"

  intersections.each do |intersection|
    intersection_set = intersection[1].to_set # inefficient!
    #if intersection_set.superset?(@clique)
      @clique.add(Integer(intersection[0]))
    #end
    print intersection[1], "\n"

  end

  @clique.add(chosen) # add the selected node itself
  @clique.to_a
end

def remove_keys(arr, hash)
  arr.each do |val|
    hash.delete(val)
  end
  hash
end

def all_max_cliques(graph)
  cliques = []
  until graph.empty? or graph.nil?
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
  print cliques

end