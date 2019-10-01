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
    puts game_over
  end

  def change number
      if (1..9).include?(number) && ttt_board.include?(number)
          ttt_board[number - 1] = player
      else
        puts "Not a valid entry. Please try again."
        change(gets.chomp.to_i)
      end
  end

  def three_sequential_row_column? board, match, outer_step, inner_step
    [0, outer_step, outer_step * 2].each do |index|
      return true if [board[index], board[index + inner_step], board[index + inner_step * 2]].all?(match)
    end
    false
  end
 
  def tic_tac_toe match
    three_sequential_row_column?(ttt_board, match, 3, 1) ||
      three_sequential_row_column?(ttt_board, match, 1, 3) ||
       [ttt_board[0], ttt_board[4], ttt_board[8]].all?(match) ||
      [ttt_board[2], ttt_board[4], ttt_board[6]].all?(match)
  end

  def game_over
    if tic_tac_toe(player)
      "#{player} wins!"
    elsif ttt_board.all?(Symbol)
      "Draw!"
    end
  end

end

if __FILE__ == $0
  game = TicTacToe.new
  game.play!
end
