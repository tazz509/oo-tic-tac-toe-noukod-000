class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
  ]

  def initialize board = nil
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index input
    input.to_i - 1
  end

  def move(index, char = 'X')
    @board[index] = char
  end

  def position_taken? position
    !(@board[position] == "" || @board[position] == " ")
  end

  def valid_move? position
    position.between?(0, 8) && !position_taken?(position)
  end

  def turn_count
    @board.count('X') + @board.count('O')
  end

  def current_player
    turn_count.odd? ? 'O' : 'X'
  end

  def turn
    puts "Please choose your move between 1-9"
    input = gets.strip
    index = input_to_index input

    if valid_move? index
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all?{|cell| @board[cell] == "X"} || win_combination.all?{|cell| @board[cell] == "O"}
        return win_combination
      end
    end
    false
  end

  def full?
    @board.all?{|cell| cell == "X" || cell == "O"}
  end

  def draw?
    if full?
      if !won?
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def over?
    draw? || won?
    # (won? board) || (full? board) || (draw? board)
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
