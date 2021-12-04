data = File.read("../inputs/_testing.txt").split("\n")
# input = File.read("../inputs/day3.txt").split

input = []

data.each { |line| input.push((line.split).map(&:to_i))}

input.each {}    