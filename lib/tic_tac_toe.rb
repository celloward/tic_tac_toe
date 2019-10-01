class TicTacToe

  def initialize
    @ttt_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @x_turn = true
    @player = :X
  end

  def play!
    puts `clear`
    puts "Welcome to Tic-Tac-Toe! Please enter the number of the space you want your symbol to go on."
    puts board
    turn
  end
  
  private 

  attr_accessor :ttt_board, :player, :x_turn

  def board
    @board =<<~BOARD

         |     |     
      #{ttt_board[0]}  |  #{ttt_board[1]}  |  #{ttt_board[2]}  
    -----|-----|-----
         |     |     
      #{ttt_board[3]}  |  #{ttt_board[4]}  |  #{ttt_board[5]}  
    -----|-----|-----
         |     |     
      #{ttt_board[6]}  |  #{ttt_board[7]}  |  #{ttt_board[8]}  
         |     |     

    BOARD
    @board
  end

  def turn
    while !game_over
      x_turn == true ? self.player = :X : self.player = :O
      print "#{player}: "
      change(gets.chomp.to_i)
      puts `clear`
      puts board
      self.x_turn = !x_turn
    end
    declare_outcome
  end

  def change number
      if (1..9).include?(number) && ttt_board.include?(number)
        ttt_board[number-1] = player
      else
        puts "Not a valid entry. Please try again."
        change(gets.chomp.to_i)
      end
  end

  def all_equal? board, a, b, c
    board[a] == board[b] && board[b] == board[c]
  end

  def select_winner_row_or_column
    [0, 1, 2].each do |i|
      row = i * 3
      if all_equal?(ttt_board, i, i + 3, i + 6)
        return ttt_board[i]
      elsif all_equal?(ttt_board, row, row + 1, row + 2)
        return ttt_board[row]
      end
    end
    nil
  end

  def select_winner_diagonal
    return ttt_board[4] if all_equal?(ttt_board, 0, 4, 8) || all_equal?(ttt_board, 2, 4, 6)
  end
 
  def game_over
    select_winner_row_or_column || select_winner_diagonal || ttt_board.all?(Symbol)
  end

  def declare_outcome
    game_over == true ? (puts "Draw!") : (puts "#{game_over} wins!")
  end

end

if __FILE__ == $0
  game = TicTacToe.new
  game.play!
end
