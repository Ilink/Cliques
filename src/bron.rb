def bron(result, possible, exclude, cliques)

      if possible.empty? and exclude.empty?
        cliques.push(result)
      end

      possible.each do |v|
        bron( union(result, v), intersection(possible, neighbors(v, possible)), intersection(exclude, neighbors(v, possible)), cliques)
        possible = rel_complement(possible, v)
        exclude = union(exclude, v)
      end

end