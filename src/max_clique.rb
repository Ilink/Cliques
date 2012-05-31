def max_clique(chosen, graph)
  # find biggest clique:
  clique = []

  intersections = {}
  chosen_set = graph[chosen].to_set
  graph[chosen].each do |potential|
    # this set conversion is more convenient, but probably not very fast
    # lets us do easy intersection calculations
    potential_set = graph[potential].to_set

    # collect all intersections so we can sort by size
    intersections[potential] = chosen_set.intersection(potential_set)
  end


  clique
end

def all_max_cliques(cliques, set)
  cliques = []
  #until set.empty?
    largest_clique = []
    set.each do |vert|
      clique = max_clique(vert, set)
      largest_clique = clique if clique.size > largest_clique.size
    end
    set.subtract(largest_clique)
  #end

end