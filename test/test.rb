require '../src/bron'
require '../src/max_clique'
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

puts "Input Graph:"
adj_matrix.each do |row|
  print row, "\n"
end

###############
# Max Clique
###############

#print adj_matrix[0]
#puts adj_matrix[1]
#print "clique: ", max_clique(0, adj_matrix), "\n"

all_max_cliques(adj_matrix)