require '../src/bron'

# Read adjacency matrix
adj_matrix = []
verts = IO.readlines("input.txt")
verts.each do |vert|
  adj_matrix.push(vert.split(" "))
end

adj_matrix.each do |row|
  print row, "\n"
end

