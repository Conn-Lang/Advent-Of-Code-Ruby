file = File.read("../inputs/_testing.in").split("\n")
file = File.read("../inputs/day5.in").split("\n")


input = file.map do |line|
    line.strip.split.map { |ele| ele.split(",") }
end
input = input.flatten!.-(["->"]).map(&:to_i)
grid = Array.new(input.max + 1){Array.new(input.max + 1, 0)}

input.each_slice(4) do |coords|
    x1, y1, x2, y2 = coords
    # p "#{x1} #{y1} #{x2} #{y2}"
    # p "y:#{y1 == y2} x:#{x1 == x2}"
    if y1 == y2
        x = [x1, x2]
        (x.min..x.max).each { |index| 
            # p index
            grid[y1][index] += 1 }
    end
    if x1 == x2
        y = [y1, y2]
        (y.min..y.max).each { |index| 
            # p index
            grid[index][x1] += 1}
    end
end

countOne = 0

grid.each do |row|
    row.each do |num|
        if num >= 2
            countOne += 1
        end
    end
end

input.each_slice(4) do |coords|
    x1, y1, x2, y2 = coords
    coordHash = {x1: y1, x2: y2}
    # p coords
    if (x1 != x2) && (y1 != y2)
        if x1 > x2
            pos = y1 > y2
            until x1 < x2 do
                # puts "#{coordHash[:x1]}\t#{x1}"

                grid[coordHash[:x1]][x1] += 1
                x1 -= 1
                if pos 
                    coordHash[:x1] = coordHash[:x1] - 1
                else
                    coordHash[:x1] = coordHash[:x1] + 1
                end
            end
        elsif x1 < x2
            pos = y1 > y2
            until x1 > x2 do
                # puts "#{x1}\t#{coordHash[:x1]}"

                grid[coordHash[:x1]][x1] += 1
                x1 += 1
                if pos 
                    coordHash[:x1] = coordHash[:x1] - 1
                else
                    coordHash[:x1] = coordHash[:x1] + 1
                end
            end
        end
    end
end
countTwo = 0

grid.each do |row|
    row.each do |num|
        if num >= 2
            countTwo += 1
        end
    end
end

# i = 0
# grid.each do |line|
#     i2 = 0
#     line.each do |ele|
#         if ele == 0
#             grid[i][i2] = "."
#         end
#         i2 += 1
#     end
#     i += 1
# end

# puts
# grid.each do |line|
#     line.each do |n|
#         print "#{n} "
#     end
#     print "\n"
# end
p countTwo
#[894, 707, 359, 172]
#!22183