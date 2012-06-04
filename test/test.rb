require '../src/bron'
require '../src/max_clique'
require '../src/util'
require '../src/graph'
require 'set'

###############
# Setup
###############

# Read adjacency matrix
  #
adj_matrix = {}
verts = IO.readlines("input.txt")
verts.each_with_index do |vert, i|
  adj_matrix[i] = vert.split(" ")
end

#puts "Input Graph:"
#adj_matrix.each do |row|
#  print row, "\n"
#end

###############
# Max Clique
###############

#print adj_matrix[0]
#puts adj_matrix[1]
#print "clique: ", max_clique(0, adj_matrix), "\n"

#
#a = {
#    :a => 1,
#    :b => 2
#}

#graph.insert(0, [1,2,3,4])
#graph.insert(1, [0,3,4,5])
#graph.insert(2, [0,1,3,4,5,6])
#graph.insert(3, [0,1,2,4])
#graph.insert(4, [0,1,2,3,5])
#graph.insert(5, [2,4,6,7,8])
#graph.insert(6, [4,5,7,8])
#graph.insert(7, [4,5,6,8])
#graph.insert(8, [4,5,6,7])

graph = Graph.new
graph.insert(3, [0,1,2,4])

graph.insert(1, [0,3,4,5])
graph.insert(0, [1,2,3,4])
graph.insert(8, [4,5,6,7])
graph.insert(6, [4,5,7,8])

graph.insert(5, [2,4,6,7,8])

graph.insert(2, [0,1,3,4,5,6])

graph.insert(7, [4,5,6,8])

graph.insert(4, [0,1,2,3,5])

print graph.inspect, "\n"

all_max_cliques(graph.graph)