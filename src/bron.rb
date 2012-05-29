require "set_util"

cliques = []
def bron(result, possible, exclude, cliques)

      if possible.empty? and exclude.empty?
        cliques.push(result)
      end

      possible.each do |v|
        bron(R ⋃ {v}, P ⋂ neighbors(v), exclude ⋂ neighbors(v))
        possible = possible \ {v}
        exclude = exclude ⋃ {v}
      end

end