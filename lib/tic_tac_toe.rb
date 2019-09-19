class TicTacToe
  attr_accessor :ttt_board
    
  def initialize
    @ttt_board = [[1, 2, 3],
                  [4, 5, 6],
                  [7, 8, 9]]
    @game_over = false
  end

  def board
    ttt_board.each do |array|
      puts array.map { |element| "__#{element}__" }.join("|")
    end
  end

# private
  def three_in_a_row? match
    for row in (0..2)
      count = 0 #can't reset for vertical or diagonal
      for item in (0..2)
        count += 1 if self[row][item] == match || self[item][row] == match || self[row][row] == match || self[row][2-item] == match
      end
      return true if count == 3
    end
    false
  end

  def game_over?
    if ttt_board.three_in_a_row?(:X) == true
      puts "X wins!"
    elsif ttt_board.three_in_a_row?(:O) == true
      puts "O wins!"
    elsif ttt_board.all?(Symbol)
      puts "Draw!"
    else
      return false
    end
    true
  end

end