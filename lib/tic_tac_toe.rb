require "matrix"
class Array

  def in_a_row? match, number
    for row in (0..self.count - 1)
      counter = 0
        for item in (0..self[row].count - 1)
          if block_given?
            yield(row, item) == match ? counter += 1 : counter = 0
            return true if counter >= number
          end
        end
    end
    false
  end

end

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
      print "#{player[x_turn]}: "
      change(gets.chomp.to_i)
    end
  end

  def change number
      if (1..9).include?(number.to_i) && ttt_board.flatten.include?(number.to_i)
        index = Matrix[*ttt_board].index(number)
        # i_row = 0
        # i_element = 0
        # ttt_board.each_with_index do |row, index| 
        #   if row.include?(number)
        #     i_row = index 
        #     i_element = row.index(number)
        #   end
        # end
        if x_turn == 1
          self.ttt_board[index[0]][index[1]] = :X
          self.x_turn = 0
        else
          self.ttt_board[index[0]][index[1]] = :O
          self.x_turn = 1
        end
      else
        puts "Not a valid entry. Please try again."
        change(gets.chomp)
      end
  end

  def pan_directional match
    if ttt_board.in_a_row?(match, 3) { |row, item| ttt_board[row][item] } == true || 
    ttt_board.in_a_row?(match, 3) { |row, item| ttt_board[item][row] } == true ||
    ttt_board.in_a_row?(match, 3) { |row, item| ttt_board[item][item] } == true ||
    ttt_board.in_a_row?(match, 3) { |row, item| ttt_board[item][2 - item] } == true
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