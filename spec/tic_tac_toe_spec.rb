require "./lib/tic_tac_toe"

describe TicTacToe do

    it "changes the board when player enters valid play" do
        subject.send(:change, 3)
        expect(subject.send(:ttt_board)).to eql([1, 2, :X, 4, 5, 6, 7, 8, 9])
    end

    it "displays graphical board" do
        expect(subject.send(:board)).to eql("\n     |     |     \n  1  |  2  |  3  \n-----|-----|-----\n     |     |     \n  4  |  5  |  6  \n-----|-----|-----\n     |     |     \n  7  |  8  |  9  \n     |     |     \n\n")
    end

    it "displays changes on graphical board" do
        subject.send(:ttt_board=, [:O, :X, :O, :X, :X, 6, :X, :O, :X])
        expect(subject.send(:board)).to eql("\n     |     |     \n  O  |  X  |  O  \n-----|-----|-----\n     |     |     \n  X  |  X  |  6  \n-----|-----|-----\n     |     |     \n  X  |  O  |  X  \n     |     |     \n\n")
    end

    it "ends when all of one symbol occupy three horizontal spaces in a row" do
        subject.send(:ttt_board=, [:X, :X, :X, 4, 5, 6, 7, 8, 9])
        expect(subject.send(:game_over)).to eql(:X)
    end

    it "ends when all of one symbol occupy three vertical spaces in a row" do
        subject.send(:ttt_board=, [1, 2, :O, 4, 5, :O, 7, 8, :O])
        subject.send(:player=, :O)
        expect(subject.send(:game_over)).to eql(:O)
    end

    it "ends when all of one symbol occupy three diagonal spaces in a row" do
        subject.send(:ttt_board=, [1, 2, :X, 4, :X, 5, :X, 8, 9])
        expect(subject.send(:game_over)).to eql(:X)
    end

    it "ends when all spaces are filled and there are no three in a row" do
        subject.send(:ttt_board=, [:O, :X, :O, :X, :X, :O, :X, :O, :X])
        expect(subject.send(:game_over)).to eql(true)
    end

    it "doesn't end until winner or draw" do
        subject.send(:ttt_board=, [:O, :X, :O, :X, :X, 6, :X, :O, :X])
        expect(subject.send(:game_over)).to eql(false)
    end

end
