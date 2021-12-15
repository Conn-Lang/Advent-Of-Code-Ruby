# frozen_string_literal: false

input = File.read('../inputs/_testing.in').split("\n").map { _1.chars.map(&:to_i) }
input = File.read('../inputs/day11.in').split("\n").map { _1.chars.map(&:to_i) }
grid_test_initial = File.read('../inputs/_testing2.in').split("\n").map { _1.chars.map(&:to_i) }
grid_test = []
grid_test_initial.each_slice(10) { grid_test.push(_1) }
# grid_test.each do |inp|
#   inp.each { p _1 }
#   puts
# end

# input = input.map { |line| line.map { _1 + 1 } }
# input.each { p _1 }

def add_adjacent(y, x, input)
  flashed = 1
  (([y - 1, 0].max)..([y + 1, input.size - 1].min)).each do |yp|
    (([x - 1, 0].max)..([x + 1, input[y].size - 1].min)).each do |xp|
      input[yp][xp] += 1
      # p ""
      flashed += add_adjacent(yp, xp, input) if input[yp][xp] == 10
    end
  end
  flashed
end

flashed = 0
part1 = 0
index = 0
until input.uniq.length == 1 && input.uniq[0].all? { _1.zero? }
  # p input.uniq.length
  index += 1
  input.size.times do |y|
    input[y].size.times do |x|
      input[y][x] += 1
      # p "#{y} #{x}"
      # puts
      flashed += add_adjacent(y, x, input) if input[y][x] == 10
    end
  end
  input.size.times do |y|
    input[y].size.times do |x|
      input[y][x] = 0 if input[y][x] > 9
    end
  end
  # i += 1
  # p "#{i} run: #{input == grid_test[i]}"
  # input.size.times do |index|
  #   p "#{input[index]}  #{grid_test[i][index]}"
  # end
  part1 = flashed if index == 100
end
# p "#{i+1} run: #{input == grid_test[i]}"

puts "part 1: #{part1}"
puts "part 2: #{index}"
