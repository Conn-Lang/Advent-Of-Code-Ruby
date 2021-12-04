input = File.read("../inputs/day2.txt").split

keypad = [[0,0,0],[0,0,0],[0,0,0]]
keypad2 = [[nil,nil,0,nil,nil],[nil,0,0,0,nil],[0,0,0,0,0],[nil,0,0,0,nil],[nil,nil,0,nil,nil]]
x = 1
y = 1
i = 1

input.each do |line|
    chars = line.chars()
    chars.each do |char|
        case char
        when "U"
            if y == 0
                next
            else
                y -= 1
            end
        when "R"
            if x == 2
                next
            else
                x += 1
            end
        when "D"
            if y == 2
                next
            else
                y += 1
            end
        when "L"
            if x == 0 
                next
            else
                x -= 1
            end
        end
    end
    keypad[y][x] += i
    i += 1
    keypad.each do |i|
        i.each { |k| print "#{k} "}
        print "\n"
    end
    puts
end

i = 1
x = 0
y = 2

# def findBounds(y)
#     case y
#     when 0
#         return [2,2]
#     when 1
#         return [1,3]
#     when 2 
#         return [0,4]
#     when 3
#         return [1,3]
#     when 4
#         return [2,2]
#     end
# end

input.each do |line|
    chars = line.chars()
    chars.each do |char|
        case char
        when "U"
            next if y == 0 || keypad2[y-1][x].nil?
            y -= 1
        when "R"
            next if x == 4 || keypad2[y][x+1].nil?
            x += 1
        when "D"
            next if y == 4 || keypad2[y+1][x].nil?
            y += 1
        when "L"
            next if x == 0 || keypad2[y][x-1].nil?
            x -= 1
        end
        # puts "(#{x}, #{y})"
    end
    keypad2[y][x] = i
    i += 1
    keypad2.each do |i|
        i.each { |k| 
            if k.nil?
                print " "
            end
            print "#{k} "}
        print "\n"
    end
end

print "\n\nkeys:\n  1 2 3\n  4 5 6\n  7 8 9\n==========\n- - 1 - -\n- 2 3 4 -\n5 6 7 8 9\n- A B C -\n- - D - -"

