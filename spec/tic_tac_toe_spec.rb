require "./lib/tic_tac_toe"

describe TicTacToe do
    it "doesn't allow multiple plays on same space" do
        expect().to eql()
    end

    it "only accepts legal numerical input" do
        expect().to eql()
    end

    it "ends when all of one symbol occupy three horizontal spaces in a row" do
        ttt_board = [[:X, :X, :X], [4, 5, 6],[7, 8, 9]]
        expect(ttt_board.game_over?).to eql(true)
    end

    it "ends when all of one symbol occupy three vertical spaces in a row" do
        ttt_board = [[1, 2, :O], [4, 5, :O],[7, 8, :O]]
        expect(ttt_board.game_over?).to eql(true)
    end

    it "ends when all of one symbol occupy three diagonal spaces in a row" do
        ttt_board = [[1, 2, :X], [4, :X, 5], [:X, 8, 9]]
        expect(ttt_board.game_over?).to eql(true)
    end

    it "ends when all spaces are filled and there are no three in a row" do
        ttt_board = [[:O, :X, :O], [:X, :X, :O], [:X, :O, :X]]
        expect(ttt_board.game_over?).to eql(true)
    end

    it "doesn't end until winner or draw" do
        ttt_board = [[:O, :X, :O], [:X, :X, 6], [:X, :O, :X]]
        expect(ttt_board.game_over?).to eql(false)
    end

    it "declares the correct winner" do
        expect().to eql()
    end

end
