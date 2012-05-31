def max_clique(chosen, graph)
  # find biggest clique:
  clique = []

  intersections = {}
  chosen_set = graph[chosen].to_set
  print "chosen set: ", chosen_set.inspect, "\n"
  graph[chosen].each do |potential|
    # this set conversion is more convenient, but probably not very fast
    # lets us do easy intersection calculations
    #puts graph, i
    potential_set = graph[Integer(potential)] # this is a really awkward way of doing this..
    #potential_set = potential.to_set
    print 'potential set: ', graph[Integer(potential)], "\n"

    # collect all intersections so we can sort by size
    intersections[potential] = chosen_set.intersection(potential_set).to_a
  end

  intersections.each_with_index do |intersection, i|
    #puts intersection
    #intersection.sort!
    # sort these based upon their value's sizes

    intersection.sort! {|x,y|
      print 'comparison:', x.size, "\t", y.size, "\t", y.size <=> x.size, "\n"
      y.size <=> x.size
    }

    #print intersection, "\n"


  end
  print 'inersections: ', intersections, "\n"
  clique
end

def all_max_cliques(graph)
  cliques = []
  #until set.empty?
    largest_clique = []
    graph.each do |vert|
      clique = max_clique(vert, graph)
      largest_clique = clique if clique.size > largest_clique.size
    end
    graph.subtract(largest_clique)
  #end

end