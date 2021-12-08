file = File.read("../inputs/_testing.in")
file = File.read("../inputs/day6.in")

input = file.split(",").map(&:to_i)
# p input


testCase = "6,0,6,4,5,6,0,1,1,2,6,0,1,1,1,2,2,3,3,4,6,7,8,8,8,8".split(",").map(&:to_i)


for i in (0...256) do
    # p input
    input = input.map{ |n| n-=1 }
    index = 0
    input.each do |n|
        if n < 0
            # p index
            input[index] = 6
            # p input[index]
            input.append(8)
        end
        index += 1
    end
    # p input
end

# p testCase

# p input
p input.count
# p testCase.count