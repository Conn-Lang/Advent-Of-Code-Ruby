file = File.read('../inputs/_testing.in').split("\n")
file = File.read('../inputs/day8.in').split("\n")

input = []
input_full = []
file.each do |line|
  input.append(line.split('|')[1].split(' '))
  input_full.append(line.split('|'))
end
# p input_full
input_full = input_full.map do |line|
  line.map(&:split)
end

# p input

solve = []
solve2 = []

input.each do |output|
  # p output
  output.each do |ele|
    # p ele
    ele_length = ele.chars.length
    solve.append(ele) if [2, 3, 4, 7].include?(ele_length)
  end
end

p "part 1: #{solve.length}"

times_through = 0
input_full.each do |line|
  line_output = []
  # p line
  key = {}
  line[0].each do |disp|
    # p disp
    case disp.length
    when 2
      key[1] = disp.chars.sort.join
    when 3
      key[7] = disp.chars.sort.join
    when 4
      key[4] = disp.chars.sort.join
    when 7
      key[8] = disp.chars.sort.join
    end
  end
  # p top
  center_top_left = key[4].chars - key[1].chars
  # p center_top_left
  bot_left = ''
  center = ''
  until key.length == 10
    times_through += 1

    line[0].each do |disp|
      # p top
      next if key.invert.key?(disp.chars.sort.join)

      case disp.length
      when 5
        if (disp.chars - center_top_left).length == 3
          key[5] = disp.chars.sort.join
        elsif key[5].nil? == false
          if ((disp.chars - key[5].chars) - key[1].chars).length == 1
            key[2] = disp.chars.sort.join
            bot_left = (disp.chars - key[5].chars) - key[1].chars
            center = (center_top_left - disp.chars)
          end
          key[3] = disp.chars.sort.join if (disp.chars - key[4].chars).length == 2
        end
      when 6
        # p center
        # p bot_left
        if (disp.chars - key[7].chars).length == 4
          # p "6 : #{disp.chars.join}"
          key[6] = disp.chars.sort.join
        end
        if (key[2].nil? == false) && (key[6].nil? == false) && (disp.chars != key[6].chars)
          if disp.chars.length == (disp.chars - bot_left).length
            # p "9 : #{disp.chars.join}"
            key[9] = disp.chars.sort.join
          else
            # p "0 : #{disp.chars.join}"
            key[0] = disp.chars.sort.join
          end
          # if disp.chars.include?(center)
          #     p "9 : #{disp.chars.join}"
          #     key[9] = disp.chars.sort.join
          # else
          #     p "0 : #{disp.chars.join}"
          #     key[0] = disp.chars.sort.join
          # end
        end
      end
    end
  end

  key = key.sort
  line[1].each do |ele|
    key.each do |key, val|
      next unless (val.chars.sort <=> ele.chars.sort).zero?

      # p val.chars.sort.join
      # p ele.chars.sort.join
      line_output.append(key)
      # p line_output
      # p "#{key} #{val}"
      # p line_output
    end
  end
  # p line
  # p key.sort
  # # p line_output
  # puts
  solve2.append(line_output)
end

solve2 = solve2.map { |output| output.map(&:to_s).join }.map(&:to_i)
# p solve2

p "part 2: #{solve2.sum}"

# p times_through

# fdgacbe cefdb cefbgd gcbe: 8394
# fcgedb cgb dgebacf gc: 9781
# cg cg fdcagb cbg: 1197
# efabcd cedba gadfec cb: 9361
# gecf egdcabf bgf bfgea: 4873
# gebdcfa ecba ca fadegcb: 8418
# cefg dcbef fcge gbcadfe: 4548
# ed bcgafe cdgba cbgef: 1625
# gbdfcae bgc cg cgb: 8717
# fgae cfgab fg bagce: 4315

# [[8 , 3, 9, 4], [9,7,8,1],[1,1,9,7],
