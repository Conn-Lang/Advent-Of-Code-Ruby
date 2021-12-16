# frozen_string_literal: false

require 'set'
input = File.read('../inputs/_testing.in').split("\n").map { _1.split('-') }
input = File.read('../inputs/day12.in').split("\n").map { _1.split('-') }
# p input
# ["start", ["A", "b"]]
# ["A", ["start", "c", "b", "end"]]
# ["b", ["start", "A", "d", "end"]]
# ["c", ["A"]]
# ["d", ["b"]]
# ["end", ["A", "b"]]

def find_connected(connections, searching, small_caves = Set.new)
  return 1 if searching == 'end'

  small_caves.add(searching) if searching != 'start' && searching != 'end' && searching.downcase == searching
  return 0 unless connections.key?(searching)

  connections[searching].map do |cave|
    # p cave
    if small_caves.include?(cave)
      0
    else
      find_connected(connections, cave, small_caves.dup)
    end
  end.sum
end

def find_connected_two(connections, location, small_caves = Set.new, double_visited = nil)
  return 1 if location == 'end'

  if location != 'start' && location != 'end' && location.downcase == location
    if small_caves.include?(location)
      double_visited = location
    else
      small_caves.add(location)
    end
  end
  return 0 unless connections.key?(location)

  connections[location].map do |cave|
    if small_caves.include?(cave) && !double_visited.nil?
      0
    else
      find_connected_two(connections, cave, small_caves.dup, double_visited)
    end
  end.sum
end

connections = Hash.new([])
input.flatten.uniq.each do |cave|
  contains_cave = Hash.new([])
  input.each do |set|
    contains_cave[cave] = contains_cave[cave].append(set) if set.include?(cave)
  end
  connections.merge!(contains_cave)
end
connections.each do |key, _|
  # p connections
  connections[key] = connections[key].flatten!.uniq
  connections[key].delete('start')
  connections[key].delete(key)
end
# connections.each { print "#{_1}\n\n" }
# p input.flatten.uniq

# path = []
p find_connected(connections, 'start')
p find_connected_two(connections, 'start')
