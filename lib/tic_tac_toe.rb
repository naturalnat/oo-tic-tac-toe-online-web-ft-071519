class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(string)
  string.to_i - 1
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(position)
     true if position.between?(0,8) && position_taken?(position) == false
   end

   def move(index, move="X")
     @board[index] = move
   end

   def turn
     puts "Please enter a number 1-9."
     input = gets.chomp
     index = input_to_index(input)

    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else
      turn
    end
   end

   def won?
     WIN_COMBINATIONS.each do |winningArrays|
       if @board[winningArrays[0]] == "X" && @board[winningArrays[1]] == "X" && @board[winningArrays[2]] =="X"
         winningArrays
         true
       elsif @board[winningArrays[0]] == "O" && @board[winningArrays[1]] == "O" && @board[winningArrays[2]] =="O"
         winningArrays
         true
       else
       false
      end
   end
end
