class TicTacToe
  attr_accessor :ttt_board, :x_turn
  attr_reader :player, :board

  def initialize
    @ttt_board = [[1, 2, 3],
                  [4, 5, 6],
                  [7, 8, 9]]
    @board = <<~BOARD
         |     |     
      #{ttt_board[0][0]}  |  #{ttt_board[0][1]}  |  #{ttt_board[0][2]}  
    -----|-----|-----
         |     |     
      #{ttt_board[1][0]}  |  #{ttt_board[1][1]}  |  #{ttt_board[1][2]}  
    -----|-----|-----
         |     |     
      #{ttt_board[2][0]}  |  #{ttt_board[2][1]}  |  #{ttt_board[2][2]}  
         |     |     
    BOARD
    @x_turn = 1
    @player = ["O", "X"]
    # turn
  end

  def turn
    while self.game_over? == false
      puts board
      puts "#{player[x_turn]}: "
      change(gets.chomp)
    end
  end

  def change number
      # if (1..9).include?(number.to_i) && ttt_board.flatten.include?(number.to_i)
        # if x_turn == 1
          self.ttt_board.flatten[self.ttt_board.flatten.index(number.to_i)] = :X
          # self.x_turn = 0
        # else
          # self.ttt_board.flatten[ttt_board.flatten.index(number.to_i)] = :O
          # self.x_turn = 1
        # end
      # else
        # puts "Not a valid entry. Please try again."
        # change(gets.chomp)
      # end
  end

  def three_in_a_row? match
    for row in (0..2)
      count = 0
        for item in (0..2)
          if block_given?
            count += 1 if yield(row, item) == match
          end
        end
      return true if count == 3
    end
    false
  end

  def pan_directional match
    if three_in_a_row?(match) { |row, item| ttt_board[row][item] } == true || 
    three_in_a_row?(match) { |row, item| ttt_board[item][row] } == true ||
    three_in_a_row?(match) { |row, item| ttt_board[item][item] } == true ||
    three_in_a_row?(match) { |row, item| ttt_board[item][2 - item] } == true
      return true
    else
      false
    end
  end

  def game_over?
    if pan_directional(:X)
      puts "X wins!"
    elsif pan_directional(:O)
      puts "O wins!"
    elsif ttt_board.flatten.all?(Symbol)
      puts "Draw!"
    else
      return false
    end
    true
  end

end

TicTacToe.new