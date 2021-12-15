input = File.read('../inputs/_testing.in').split("\n").map { |line| line.chars.map(&:to_i) }
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

point =  lambda do |y, x|
  return 999 if y >= h || x >= w

  return 999 if y.negative? || x.negative?

  return input[y][x]
end

(0...h).each do |y|
  (0...w).each do |x|
    low_point = point[y, x] < point[y, x + 1] && point[y, x] < point[y, x - 1] && point[y, x] < point[y + 1, x] && point[y, x] < point[y - 1, x]
    part1.append(point[y, x] + 1) if low_point
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

visited = {}
part2 = []
fill = lambda do |y, x|
  basin = { size: 0 }
  part2 << basin
  traverse = lambda do |k, j|
    return unless point[k, j] < 9
    return if visited[[k, j]]

    visited[[k, j]] = basin
    basin[:size] += 1
    traverse[k - 1, j]
    traverse[k + 1, j]
    traverse[k, j - 1]
    traverse[k, j + 1]
  end
  traverse[y, x]
end

(0...h).each do |y|
  (0...w).each do |x|
    fill[y, x]
  end
end
visited.each { p _1 }
p part2.map { _1[:size] }.sort.last(3).inject(&:*)
