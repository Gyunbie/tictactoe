require_relative "board.rb"
require_relative "human_player.rb"

class Game
  def initialize(player1_mark, player2_mark)
    @player1 = HumanPlayer.new(player1_mark)
    @player2 = HumanPlayer.new(player2_mark)
    @current_player = @player1
    @board = Board.new(get_board_size)
  end

  def switch_turn
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def get_board_size
    print "Enter a board size > "
    b_size = gets.chomp.to_i
    if b_size < 2
      puts "Size should be 2 or more."
      get_board_size
    end
    b_size
  end

  def play
    @board.print
    @board.place_mark(@current_player.get_position, @current_player.mark)
    
    if @board.win?(@current_player.mark)
      @board.print
      puts "Congrats, #{@current_player.mark} wins!"
    else
      switch_turn
      play
    end
  end
end

game = Game.new(:X, :O)
game.play