file = File.read("../inputs/_testing.in")
file = File.read("../inputs/day7.in")

input = file.split(",").map(&:to_i)
solutions = []

input.sort!
goalIndex = (input.length / 2)
goals = [input[goalIndex], input[goalIndex + 1]]
# p endGoal

# (input.min..input.max).each do |goal|
goals.each do |goal|
    fuelCount = 0
    workingInput = input.dup
    workingInput.each do |n|
        fuelCount += [n, goal].max - [n, goal].min
    end
    solutions.append(fuelCount)
end
# p input
p solutions.min

solutions = []
(input.min..input.max).each do |goal|
    fuelCount = 0
    input.each do |n|
        stepCount = 0
        step = [goal, n].max - [goal, n].min
        (1..step).each do |index|
            fuelCount += index
        end
    end
    solutions.append(fuelCount)
    p solutions
    puts
end

p solutions.min