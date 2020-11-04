class TicTacToe
    attr_accessor :board

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]
    
    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

    def display_board
         puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
         puts "--------------------------------------------"
         puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
         puts "____________________________________________"
         puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input = input.to_i - 1
    end

    def move(index, play_token = "x")
        @board[index] = play_token
    end

    def position_taken?(index)
        @board[index] != " "
    end   

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        @board.count do |count|
            count == "X" || count == "O"
        end
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        index = input_to_index(gets.chomp) 
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    end

    def won?
       WIN_COMBINATIONS.detect do |win|
        @board[win[0]] ==
        @board[win[1]] &&
        @board[win[1]] ==
        @board[win[2]] &&
        position_taken?(win[1])
       end
    end

    def full?
        @board.none? do |input|
            input == " "
        end
    end

    def draw?
        if won? || !full?
            false
        else
            true
        end
    end

    def over?
        if won? || full? || draw?
            true
        else
            false
        end
    end

    def winner
        if won?
            @board[won?[1]]
        end
    end

    def play
        until over?
            turn
        end
        if draw?
            puts "Cat's Game!"
        else
            puts "Congratulations #{winner}!"
        end
    end
end