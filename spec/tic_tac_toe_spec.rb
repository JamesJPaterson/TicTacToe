require 'tic_tac_toe'

describe TicTacToe do
    it "Comes up with a prompt to play your first move" do
        game = TicTacToe.new
        expect(game.play).to eq ("Player one please select a square 1-9")
    end
end