input = File.read("../inputs/_testing.in").split("\n")
input = File.read("../inputs/day3.in").split("\n")

lines = []

input.each do |line|
    lines.push(line.chars())
end

digitsMax = Array.new(lines[0].length, 0)
digitsMin = Array.new(lines[0].length, 0)
digitCountOne = Array.new(lines[0].length, 0)
digitCountZero = Array.new(lines[0].length, 0)
digitCounts = []

lines.each do |line|
    i = 0
    line.each do |char|
        case char
        when "1"
            # p digitCountOne
            # p i
            digitCountOne[i] += 1
        when "0"
            digitCountZero[i] += 1
        end
        i += 1
    end
    # p i
end

digitCounts = digitCountOne.zip(digitCountZero)

i = 0
digitCounts.each do |index|
    if index[0] > index[1]
        digitsMax[i] = 1
        digitsMin[i] = 0
    elsif index[0] < index[1]
        digitsMax[i] = 0
        digitsMin[i] = 1
    end
    i += 1
end

i = 0
while i < 5 do
    digitsMax[i] = digitsMax[i].to_s()
    digitsMin[i] = digitsMin[i].to_s()
    i += 1
end

digitsMax = digitsMax.join()
digitsMin = digitsMin.join()

puts "gamma: #{digitsMax.to_i(2)}\nepsilon: #{digitsMin.to_i(2)}\ntotal: #{digitsMin.to_i(2) * digitsMax.to_i(2)}"

def thinArray(array, index)
    # p index
    bigArray, smalArray = array.transpose.map(&:compact)
    bigDigitCountOne = 0
    bigDigitCountZero = 0
    smalDigitCountOne = 0
    smalDigitCountZero = 0

    bigArray.each do |line|
        case line[index]
        when "1"
            bigDigitCountOne += 1
        when "0"
            bigDigitCountZero += 1
        end
    end
    smalArray.each do |line|
        case line[index]
        when "1"
            smalDigitCountOne += 1
        when "0"
            smalDigitCountZero += 1
        end
    end

    finalBigArray = []
    finalSmalArray = []
    
    if bigArray.length == 1
        finalBigArray.append(bigArray[0])
    end
    if smalArray.length == 1
        finalSmalArray.append(smalArray[0])
    end

    if bigDigitCountOne > bigDigitCountZero
        bigArray.each do |line|
            if line[index] == "1"
                finalBigArray.append(line)
            end
        end
    elsif bigDigitCountOne < bigDigitCountZero
        bigArray.each do |line|
            if line[index] == "0"
                finalBigArray.append(line)
            end
        end
    elsif bigDigitCountOne == bigDigitCountZero
        bigArray.each do |line|
            if line[index] == "1"
                finalBigArray.append(line)
            end
        end
    end

    if smalDigitCountOne > smalDigitCountZero
        smalArray.each do |line|
            if line[index] == "0"
                finalSmalArray.append(line)
            end
        end
    elsif smalDigitCountOne < smalDigitCountZero
        smalArray.each do |line|
            if line[index] == "1"
                finalSmalArray.append(line)
            end
        end
    elsif smalDigitCountOne == smalDigitCountZero
        smalArray.each do |line|
            if line[index] == "0"
                finalSmalArray.append(line)
            end
        end
    end
    
    return finalBigArray.zip(finalSmalArray)
end

linesZipped = lines.zip(lines)
i = 0
while i < lines[0].length do
    linesZipped = thinArray(linesZipped,i)
    i += 1
    # linesZipped.transpose()[0].each { |line| print "#{line}\n" }
    # puts
    # linesZipped.transpose()[1].each { |line| print "#{line}\n" }
    # puts "\n\n\n\n\n"
end

oxygen, carbon = linesZipped.transpose.map(&:compact)
oxygen = oxygen[0].join
carbon = carbon[0].join
oxygen

puts "\noxygen: #{oxygen.to_i(2)}\ncarbon: #{carbon.to_i(2)}\ntotal: #{oxygen.to_i(2) * carbon.to_i(2)}"