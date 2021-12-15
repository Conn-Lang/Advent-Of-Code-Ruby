# frozen_string_literal: false

require 'set'
input = File.read('../inputs/_testing.in').split("\n").map { _1.split('-') }
# input = File.read('../inputs/day11.in').split("\n").map { _1.split('-') }

# ["start", ["A", "b"]]
# ["A", ["start", "c", "b", "end"]]
# ["b", ["start", "A", "d", "end"]]
# ["c", ["A"]]
# ["d", ["b"]]
# ["end", ["A", "b"]]

def find_connected()

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
  connections[key] = connections[key].flatten!.uniq
  connections[key].delete('start')
  connections[key].delete(key)
end
# connections.each { print "#{_1}\n\n" }
# p input.flatten.uniq

path = []
paths = find_connected('start', connections, path)
p paths
