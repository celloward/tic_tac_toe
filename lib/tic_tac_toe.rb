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

private
  def game_over?
  end

end

# The Gameplay Interface
