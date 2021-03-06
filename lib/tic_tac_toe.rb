WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]

  def display_board(board)
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def move(board, location, player = "X")

    board[location.to_i-1] = player

  end

  def position_taken?(board, location)
    !(board[location].nil? || board[location] == " ")
  end

  def valid_move?(board, position)
    position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
  end

  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip

      if valid_move?(board, input)
        move(board, input, current_player(board))
      else
        turn(board)
      end

    display_board(board)
  end

  def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
    counter
  end

  def current_player(board)
    turn_count(board) % 2 == 0 ? "X" : "O"
  end

  def won?(board)

    WIN_COMBINATIONS.detect do |win|
    if position_taken?(board, win[0]) && position_taken?(board, win[1]) && position_taken?(board, win[2]) && board[win[0]] == board[win[1]] && board[win[0]] == board[win[2]]
      [win[0],win[1], win[2]]
    end
    end
  end


  def full?(board)
    unless board.include?(" ")
      return true
    end
  end


  def draw?(board)
    if full?(board) && !won?(board)
      true
    end
  end

  def over?(board)
    if won?(board) || draw?(board)
      true
    end
  end

  def winner(board)
    if win = won?(board)
      return board[win[0]]
    else
       nil
    end
  end

def play(board)

  # counter = 0
  until over?(board)
    turn(board)
    # counter += 1
  end

  if won?(board)
    winner = winner(board)
    puts "Congratulations #{winner}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
