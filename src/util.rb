def remove_keys(arr, hash)
  arr.each do |val|
    hash.delete(Integer(val))
  end
  hash
end

def convert_to_set (intersections)
  intersection_set = {}
  intersections.each do |intersection|
    intersection_set[intersection[0]] = intersection[1].to_set
  end
  intersection_set
end