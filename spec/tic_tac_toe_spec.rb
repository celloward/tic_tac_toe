require "./lib/tic_tac_toe"

describe TicTacToe do
    it "doesn't allow multiple plays on same space" do
        expect().to eql()
    end

    it "only accepts legal numerical input" do
        game = TicTacToe.new
        game.change("abc").should_receive(:Not a valid entry. Please try again.)
    end

    it "changes the board when player enters valid play" do
        game = TicTacToe.new
        game.change(3)
        expect(game.ttt_board).to eql([[1, 2, :X], [4, 5, 6], [7, 8, 9]])
    end

    it "displays graphical board" do
        game = TicTacToe.new
        expect(game.board).to eql("     |     |     \n  1  |  2  |  3  \n-----|-----|-----\n     |     |     \n  4  |  5  |  6  \n-----|-----|-----\n     |     |     \n  7  |  8  |  9  \n     |     |     \n")
    end

    it "displays changes on graphical board" do
        game = TicTacToe.new
        game.ttt_board = [[:O, :X, :O], [:X, :X, 6], [:X, :O, :X]]
        expect(game.board).to eql("     |     |     \n  O  |  X  |  O  \n-----|-----|-----\n     |     |     \n  X  |  X  |  6  \n-----|-----|-----\n     |     |     \n  X  |  O  |  X  \n     |     |     \n")
    end

    it "ends when all of one symbol occupy three horizontal spaces in a row" do
        game = TicTacToe.new
        game.ttt_board = [[:X, :X, :X], [4, 5, 6],[7, 8, 9]]
        expect(game.game_over?).to eql(true)
    end

    it "ends when all of one symbol occupy three vertical spaces in a row" do
        game = TicTacToe.new
        game.ttt_board = [[1, 2, :O], [4, 5, :O],[7, 8, :O]]
        expect(game.game_over?).to eql(true)
    end

    it "ends when all of one symbol occupy three diagonal spaces in a row" do
        game = TicTacToe.new
        game.ttt_board = [[1, 2, :X], [4, :X, 5], [:X, 8, 9]]
        expect(game.game_over?).to eql(true)
    end

    it "ends when all spaces are filled and there are no three in a row" do
        game = TicTacToe.new
        game.ttt_board = [[:O, :X, :O], [:X, :X, :O], [:X, :O, :X]]
        expect(game.game_over?).to eql(true)
    end

    it "doesn't end until winner or draw" do
        game = TicTacToe.new
        game.ttt_board = [[:O, :X, :O], [:X, :X, 6], [:X, :O, :X]]
        expect(game.game_over?).to eql(false)
    end

    it "declares the correct winner" do
        expect().to eql()
    end

end
