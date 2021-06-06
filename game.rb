require_relative "board.rb"
require_relative "human_player.rb"

class Game
  def initialize(*player_marks)
    @players = []
    player_marks.each { |mark| @players << HumanPlayer.new(mark) }
    @current_player = @players[0]
    @board = Board.new(get_board_size)
  end

  def switch_turn
    @players.rotate!
    @current_player = @players[0]
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
    place = @board.place_mark(@current_player.get_position, @current_player.mark)
    
    unless place
      play
    end
    
    if @board.win?(@current_player.mark)
      @board.print
      puts "Congrats, #{@current_player.mark} wins!"
    else
      switch_turn
      play
    end
  end
end

game = Game.new(:X, :O, :A, :B)
game.play