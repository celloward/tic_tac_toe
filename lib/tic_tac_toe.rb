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
  def three_in_a_row?
    for a in (0..3)
      x = 0
      o = 0
      for b in (0..3)
        if yield 

  def game_over?
    three_in_a_row?({ |a, b| ttt_board[b][a] })
  end

end

# The Gameplay Interface
