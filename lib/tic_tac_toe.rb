class TicTacToe
    def initialize
      @moves = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      @moves_counter = 1
    end
  
    def display_board
      puts " #{@moves[0]} | #{@moves[1]} | #{@moves[2]} "
      puts "---+---+---"
      puts " #{@moves[3]} | #{@moves[4]} | #{@moves[5]} "
      puts "---+---+---"
      puts " #{@moves[6]} | #{@moves[7]} | #{@moves[8]} "
    end
  
    def play
      loop do
        display_board
        player = @moves_counter % 2 == 0 ? "Player 2" : "Player 1"
        puts "#{player}, please select a square (1-9):"
        user_input = gets.chomp.to_i - 1
        if user_input.between?(0, 8) && @moves[user_input] == " "
          @moves[user_input] = @moves_counter % 2 == 0 ? "O" : "X"
          @moves_counter += 1
        else
          puts "Invalid move, please try again."
        end
        break if game_over?
      end
      display_board
      puts game_result
    end
  
    def game_over?
      @moves_counter > 9 || winner? || tie?
    end
  
    def winner?
      WINNING_COMBINATIONS.any? do |a, b, c|
        @moves[a] == @moves[b] && @moves[b] == @moves[c] && @moves[a] != " "
      end
    end
  
    def tie?
      @moves.all? { |move| move != " " }
    end
  
    def game_result
      if winner?
        player = @moves_counter % 2 == 0 ? "Player 1" : "Player 2"
        "#{player} wins!"
      else
        "Tie game!"
      end
    end
  
    WINNING_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
  end
  
ttt = TicTacToe.new

ttt.display_board
ttt.play