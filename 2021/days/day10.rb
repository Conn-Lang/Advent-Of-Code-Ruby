# frozen_string_literal: false

input = File.read('../inputs/_testing.in').split("\n").map { _1.chars }
input = File.read('../inputs/day10.in').split("\n").map{ _1.chars }

# p input
key = { ')' => 3, ']' => 57, '}' => 1197, '>' => 25_137 }
key_two = { ')' => 1, ']' => 2, '}' => 3, '>' => 4 }
parenth_key = { '(' => ')', '[' => ']', '{' => '}', '<' => '>' }
count = { ')' => 0, ']' => 0, '}' => 0, '>' => 0 }
invalid_lines = []
completion_strings = []
sums = []

# p parenth_key.invert

input.each do |line|
  # next if (line.length % 2) == 1
  stack = []
  line.each do |brack|
    # p stack
    if parenth_key.keys.include?(brack)
      stack.push(brack)
    elsif parenth_key.values.include?(brack)
      if stack[-1] != parenth_key.invert[brack]
        invalid_lines.push(line)
        count[brack] += 1
        break
      else
        stack.pop
      end
    end
  end
end

# [({(<(())[]>[[{[]{<()<>>
p count

count.each do |k, v|
  count[k] = key[k] * count[k]
end
p count.values.sum

input -= invalid_lines
input.each do |line|
  stack = []
  complet_string = []
  line.each do |brack|
    if parenth_key.keys.include?(brack)
      stack.push(brack)
    elsif parenth_key.values.include?(brack)
      stack.pop
    end
  end
  stack.reverse.each do |brack|
    complet_string.push(parenth_key[brack])
  end
  completion_strings.push(complet_string.join)
end

completion_strings.each do |comp_string|
  sum = 0
  comp_string.chars.each do |brack|
    sum *= 5
    sum += key_two[brack]
  end
  sums.push(sum)
end
sums.sort
until sums.length == 1
  sums.delete(sums.max)
  sums.delete(sums.min)
end
p sums[0]
