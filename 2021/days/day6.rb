input_initial = File.read('../inputs/_testing.in').split(',').map(&:to_i)
input_initial = File.read('../inputs/day6.in').split(',').map(&:to_i)
# p input

# test_case = '6,0,6,4,5,6,0,1,1,2,6,0,1,1,1,2,2,3,3,4,6,7,8,8,8,8'.split(',').map(&:to_i)
input = input_initial.dup
(0...80).each do |_i|
  # p input
  input = input.map { |n| n - 1 }
  index = 0
  input.each do |n|
    if n.negative?
      # p index
      input[index] = 6
      # p input[index]
      input.append(8)
    end
    index += 1
  end
  # p input
end

# p test_case

# p input
p "part 1: #{input.count}"
# p test_case.count

input = input_initial.dup
# p input
per_day = input.tally
# p per_day.sort
256.times do |_i|
  new_per_day = Hash.new(0)
  per_day.each do |fish_time, fish_count|
    if fish_time.zero?
      new_per_day[6] += fish_count
      new_per_day[8] += fish_count
    else
      new_per_day[fish_time - 1] += fish_count
    end
  end
  per_day = new_per_day
end
p "part 2: #{per_day.values.sum}"
