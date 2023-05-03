require_relative "../lib/tic_tac_toe.rb"

describe TicTacToe do
    it "Allows players to see the board" do
        game = TicTacToe.new
        expect(game.display_board).to eq nil
      end


      it "should have a counter set to 1" do
        game = TicTacToe.new
        expect(game.moves_counter).to eq(1)
      end

    it "Allows players to make valid moves" do
        game = TicTacToe.new
        game.play(0) # simulate user input
        expect(game.moves[0]).to eq "X"
      end

      it "Does not allow players to make invalid moves" do
        game = TicTacToe.new
        game.play(10)
        expect(game.moves[0]).to eq " "
      end

      it "should declare a winner if there is one" do
        game = TicTacToe.new
        game.play(0)
        game.play(5)
        game.play(1)
        game.play(6)
        game.play(2)
        expect(game.game_result).to eq("Player 1 wins!")
      end
      
end