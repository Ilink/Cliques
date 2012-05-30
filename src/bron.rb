require_relative "./set_util"


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

def max_clique(chosen, set)
  # find biggest clique:
  clique = []
  chosen.each do |neighbor|
    set[neighbor].each do |potential_vert|
      clique.push(intersection(set[neighbor], set[potential_vert]))
    end
  end
end

def all_max_cliques(cliques, set)
  until set.empty?
    #cliques.push(max_clique(set.first, set))
    set.each do |vert|
      max_clique(vert, set)
    end

  end
end