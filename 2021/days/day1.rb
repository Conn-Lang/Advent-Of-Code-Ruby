input = File.read("../inputs/day1.in").split.map(&:to_i)

i = 1
thirds = 3

increase = 0
thirdsIncrease = 0

while i < input.length()
    if input[i] > input[i-1]
        increase += 1
    end
    i += 1
end

while thirds < input.length()
    b = input[thirds] + input[thirds-1] + input[thirds-2]
    a = input[thirds-1] + input[thirds-2] + input[thirds-3]
    if b > a
        thirdsIncrease += 1
    end
    thirds += 1
end

p "part 1: #{increase}"
p "part 2: #{thirdsIncrease}"