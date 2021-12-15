# frozen_string_literal: false

input = File.read('../inputs/_testing.in').split("\n").map { _1.split('-') }
# input = File.read('../inputs/day11.in').split("\n").map { _1.split('-') }
# p input

# ["start", ["A", "b"]]
# ["A", ["start", "c", "b", "end"]]
# ["b", ["start", "A", "d", "end"]]
# ["c", ["A"]]
# ["d", ["b"]]
# ["end", ["A", "b"]]
i = 0
def find_connected(searching, connections, path, i)
  i += 1
  path.append(searching)
  caves = connections[searching]
  return path unless searching != 'end'

  return path unless i < 2

  caves.each do |cave|
    if cave == 'start'
      p 'cave = start'
      next
    end
    p searching
    path.append(find_connected(cave, connections, path, i))
    p path
  end
  path
end

connections = Hash.new([])
input.flatten.uniq.each do |cave|
  contains_cave = Hash.new([])
  input.each do |set|

    if set.include?(cave)
      contains_cave[cave] = contains_cave[cave].append(set)
    end
  end
  connections.merge!(contains_cave)
end
# connections.each { print "#{_1}\n\n" }
connections.each do |key, _|
  connections[key] = connections[key].flatten!.uniq
  connections[key].delete(key)
end
# connections.each { print "#{_1}\n\n" }
# p input.flatten.uniq
path = []
paths = find_connected('start', connections, path, i)
p paths

# ["start", ["A", "b"]]
# ["A", ["start", "c", "b", "end"]]
# ["b", ["start", "A", "d", "end"]]
# ["c", ["A"]]
# ["d", ["b"]]
# ["end", ["A", "b"]]
