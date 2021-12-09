file = File.read("../inputs/_testing.in").split("\n")
file = File.read("../inputs/day8.in").split("\n")

input = []
inputFull = []
file.each do |line|
    input.append(line.split("|")[1].split(" "))
    inputFull.append(line.split("|"))
end
# p inputFull
inputFull = inputFull.map do |line|
    line.map(&:split)
end

# p input

solve = []
solve2 = []


input.each do |output|
    # p output
    output.each do |ele|
        # p ele
        eleLength = ele.chars.length
        if [2,3,4,7].include?(eleLength)
            solve.append(ele)
        end
    end
end

p "part 1: #{solve.length}"

timesThrough = 0
inputFull.each do |line|
    lineOutput = []
    # p line
    key = Hash.new
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
    top = (key[7].chars - key[1].chars).join
    # p top
    centerTopLeft = key[4].chars - key[1].chars
    # p centerTopLeft
    botLeft = ""
    center = ""
    until key.length == 10
        timesThrough += 1

        line[0].each do |disp|
            # p top
            if key.invert.has_key?(disp.chars.sort.join)
                next
            end
            case disp.length
            when 5
                if (disp.chars - centerTopLeft).length == 3
                    key[5] = disp.chars.sort.join
                elsif key[5].nil? == false
                    if ((disp.chars - key[5].chars) -  key[1].chars).length == 1
                        key[2] = disp.chars.sort.join
                        botLeft = (disp.chars - key[5].chars) -  key[1].chars
                        center = (centerTopLeft - disp.chars)
                    end
                    if (disp.chars - key[4].chars).length == 2
                        key[3] = disp.chars.sort.join
                    end
                end
            when 6
                # p center
                # p botLeft
                if (disp.chars - key[7].chars).length == 4
                    # p "6 : #{disp.chars.join}"
                    key[6] = disp.chars.sort.join
                end
                if (key[2].nil? == false) && (key[6].nil? == false) && (disp.chars != key[6].chars)
                    if disp.chars.length == (disp.chars - botLeft).length
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

            if (val.chars.sort <=> ele.chars.sort) == 0
                # p val.chars.sort.join
                # p ele.chars.sort.join
                lineOutput.append(key)
                # p lineOutput
            end
            # p "#{key} #{val}"
            # p lineOutput
        end
    end
    # p line
    # p key.sort
    # # p lineOutput
    # puts 
    solve2.append(lineOutput)
    
end

solve2 = solve2.map { |output| output.map(&:to_s).join }.map(&:to_i)
# p solve2

p "part 2: #{solve2.sum}"

# p timesThrough

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