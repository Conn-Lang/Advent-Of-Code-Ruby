file = File.read("../inputs/_testing.in").split("\n")
file = File.read("../inputs/day4.in").split("\n")

draws = file.shift.split(",").map(&:to_i)
boards = file.each_slice(6).map do |b|
    b[1,5].map { |n| n.split.map(&:to_i) }
end

result = []

draws.each do |draw|
    boards.dup.each do |board|
      (0...5).each do |row|
        (0...5).each do |col|
          board[row][col] = -1 if board[row][col] == draw
        end
      end
  
      tp = board.transpose
    #   p board
    #   p tp

    #   won = (0...5).any? { |n| board[n].all?(&:negative?) || tp[n].all?(&:negative?) }
      for n in (0...5) do
        won = board[n].all?(&:negative?) || tp[n].all?(&:negative?)
        if won
            # puts board.flatten.select(&:positive?).sum * draw
            result.append(board.flatten.select(&:positive?).sum * draw)
            boards.delete(board)
          end
      end
    #   if won
    #     puts board.flatten.select(&:positive?).sum * draw
    #     boards.delete(board)
    #   end
    end
  end

p result[0]
p result[-1]