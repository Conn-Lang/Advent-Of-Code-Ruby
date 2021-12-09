input = File.read('../inputs/_testing.in').split("\n").map{ |line| line.chars.map(&:to_i) }
input = File.read('../inputs/day9.in').split("\n").map{ |line| line.chars.map(&:to_i) }

# inputY = inputX.transpose
# input.each do |line|
#     print "#{line}\n"
# end
# puts
# input.transpose.each do |line|
#     print "#{line}\n"
# end

h = input.length
w = input[0].length
part1 = []
point =  lambda(y, x) do
  return 999 if y >= h || x >= w

  return 999 if y.negative? || x.negative?

  return input[y][x]
end

(0...h).each do |y|
  (0...w).each do |x|
    low_point = point[y,x] < point[y,x+1] && point[y,x] < point[y,x-1] && point[y,x] < point[y+1,x] && point[y,x] < point[y-1,x]
    part1.append(point[y,x] + 1) if low_point
  end
end
p part1.sum

# Part 1
# sum = 0
# (0...h).each do |i|
#     (0...w).each do |j|
#         low_point =
#             pt[i,j] < pt[i+1,j] &&
#             pt[i,j] < pt[i-1,j] &&
#             pt[i,j] < pt[i,j+1] &&
#             pt[i,j] < pt[i,j-1]
#         sum += pt[i,j] + 1 if low_point
#     end
# end
# 1574
