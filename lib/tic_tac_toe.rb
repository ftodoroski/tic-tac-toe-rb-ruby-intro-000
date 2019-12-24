WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-------------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-------------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, position, player_token)
  board[position] = player_token
end

# Is the position occupied by a token
def position_taken?(board, position)
  !(board[position] == " ")
end

def valid_move?(board, position)
  position.between?(0, 8) && !position_taken?(board, position)
end

def turn(board)
  puts "Please choose a position 1-9:"
  user_input = gets.strip
  converted = input_to_index(user_input)
  player_token = "X"

  until valid_move?(board, converted)
    puts "Please choose a position 1-9:"
    player_input = gets.strip
    converted = input_to_index(player_input)
  end

  move(board, converted, player_token)
  display_board(board)
end

def turn_count(board)
    board.count { |pos| pos != " " }
end

def current_player(board)
    turn_count(board).even? ? "X" : "O"
end

def won?(board)
    WIN_COMBINATIONS.each do |winning_combination|
        if board[winning_combination[0]] == "X" && board[winning_combination[1]] == "X" && board[winning_combination[2]] == "X"
            return winning_combination
        elsif board[winning_combination[0]] == "O" && board[winning_combination[1]] == "O" && board[winning_combination[2]] == "O"
            return winning_combination
        else
            return false
        end
    end
end
