input = File.read('../inputs/_testing.in').split(',').map(&:to_i)
input = File.read('../inputs/day6.in').split(',').map(&:to_i)
# p input

# test_case = '6,0,6,4,5,6,0,1,1,2,6,0,1,1,1,2,2,3,3,4,6,7,8,8,8,8'.split(',').map(&:to_i)

(0...256).each do |_i|
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
p input.count
# p test_case.count
