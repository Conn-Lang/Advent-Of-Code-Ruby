input = File.read("../inputs/_testing.in").split("\n")
input = File.read("../inputs/day2.in").split("\n")

lines = []

dep = 0
dep2 = 0
pos = 0
pos2 = 0
aim = 0

input.each do |l|
    line = l.split(" ")
    line[1] = line[1].to_i
    lines.push(line)
end

lines.each do |line|
    x = line[1]
    case line[0]
    when "forward"
        pos += x
        pos2 += x
        dep2 += (aim * x)
    when "up"
        dep -= x
        aim -= x
    when "down"
        dep += x
        aim += x
    end
end

print "\nPart 1:\ndepth: #{dep} position: #{pos}\ntotal: #{dep * pos}\n\n"
print "\nPart 2:\ndepth: #{dep2} position: #{pos2}\ntotal: #{dep2 * pos2}\n\n"