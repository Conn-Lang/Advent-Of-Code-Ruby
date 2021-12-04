input = File.read("../inputs/day1.txt").split
# input = File.read("../inputs/_testing.txt").split


$r = 360
$x = 0
$y = 0
$visited = [[0,0]]
$twice = []

def travel(angle, dist)
    theta = angle % 360
    if theta == 90
        initial = $x+1
        $x += dist
        (initial..$x).step(1) do |temp|
            coord = [temp, $y]
            if $visited.include?(coord)
                $twice.push(coord)
            end
            $visited.push(coord)
        end
    elsif theta == 180
        initial = $y-1
        $y -= dist
        ($y..initial).step(1) do |temp|
            coord = [$x, temp]
            if $visited.include?(coord)
                $twice.push(coord)
            end
            $visited.push(coord)
        end
    elsif theta == 270
        initial = $x-1
        $x -= dist
        ($x..initial).step(1) do |temp|
            coord = [temp, $y]
            if $visited.include?(coord)
                $twice.push(coord)
            end
            $visited.push(coord)
        end
    elsif theta == 360 || theta == 0
        initial = $y+1
        $y += dist
        (initial..$y).step(1) do |temp|
            coord = [$x, temp]
            if $visited.include?(coord)
                $twice.push(coord)
            end
            $visited.push(coord)
            
        end
    end
    
end

input.each do |operation|
    case operation[0]
    when 'R'
        $r += 90
        travel($r, operation.delete("^0-9").to_i)
    when 'L'
        $r -= 90
        travel($r, operation.delete("^0-9").to_i)
    end
end

puts "x:#{$x.abs()} y:#{$y.abs()}\nresult: #{$x.abs()+$y.abs()}\nfirst twice: #{$twice[0][0].abs() + $twice[0][1].abs()} #{$twice[0]}"

puts "\n"
# $twice.each { |coord| puts "(#{coord[0]}, #{coord[1]})"}
