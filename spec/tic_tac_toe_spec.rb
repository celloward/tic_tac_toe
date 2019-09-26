require "./lib/tic_tac_toe"

describe TicTacToe do
    it "doesn't allow multiple plays on same space"
    
#    it "only accepts legal numerical input" do
#        game = TicTacToe.new
#        game.change("abc").should_receive(:Not a valid entry. Please try again.)
#    end

    it "changes the board when player enters valid play" do
        subject.change(3)
        expect(subject.ttt_board).to eql([1, 2, :X, 4, 5, 6, 7, 8, 9])
    end

    it "displays graphical board" do
        expect(subject.board).to eql("\n     |     |     \n  1  |  2  |  3  \n-----|-----|-----\n     |     |     \n  4  |  5  |  6  \n-----|-----|-----\n     |     |     \n  7  |  8  |  9  \n     |     |     \n\n")
    end

    it "displays changes on graphical board" do
        subject.ttt_board = [:O, :X, :O, :X, :X, 6, :X, :O, :X]
        expect(subject.board).to eql("\n     |     |     \n  O  |  X  |  O  \n-----|-----|-----\n     |     |     \n  X  |  X  |  6  \n-----|-----|-----\n     |     |     \n  X  |  O  |  X  \n     |     |     \n\n")
    end

    it "ends when all of one symbol occupy three horizontal spaces in a row" do
        subject.ttt_board = [:X, :X, :X, 4, 5, 6, 7, 8, 9]
        expect(subject.game_over?).to eql("X wins!")
    end

    it "ends when all of one symbol occupy three vertical spaces in a row" do
        subject.ttt_board = [1, 2, :O, 4, 5, :O, 7, 8, :O]
        subject.player = :O
        expect(subject.game_over?).to eql("O wins!")
    end

    it "ends when all of one symbol occupy three diagonal spaces in a row" do
        subject.ttt_board = [1, 2, :X, 4, :X, 5, :X, 8, 9]
        expect(subject.game_over?).to eql("X wins!")
    end

    it "ends when all spaces are filled and there are no three in a row" do
        subject.ttt_board = [:O, :X, :O, :X, :X, :O, :X, :O, :X]
        expect(subject.tic_tac_toe(:O)).to eql(false)
    end

    it "doesn't end until winner or draw" do
        subject.ttt_board = [:O, :X, :O, :X, :X, 6, :X, :O, :X]
        expect(subject.game_over?).to eql(nil)
    end

    describe "Array#three_sequential?" do

      it "does various righteous things"

    end

end
