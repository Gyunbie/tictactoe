require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game
  def initialize(hash)
    @players = []
    hash.each do |k, v|
      if v
        @players << ComputerPlayer.new(k)
      else
        @players << HumanPlayer.new(k)
      end
    end
    @current_player = @players[0]
    @board_size = get_board_size
    @board = Board.new(@board_size)
    @legal_positions = @board.legal_positions
  end

  def switch_turn
    @players.rotate!
    @current_player = @players[0]
  end

  def get_board_size
    print "Enter a board size > "
    board_size = gets.chomp.to_i
    if board_size < 2
      puts "Size should be 2 or more."
      get_board_size
    end
    board_size
  end

  def play
    @board.print
    @board.place_mark(@current_player.get_position(@legal_positions), @current_player.mark)
    
    if @board.win?(@current_player.mark)
      @board.print
      puts "Congrats, #{@current_player.mark} wins!"
    else
      @legal_positions = @board.legal_positions

      if @legal_positions.empty?
        puts "Board is full! Creating a new board."
        @board = Board.new(@board_size)
        @legal_positions = @board.legal_positions
      end
      
      switch_turn
      play
    end
  end
end

game = Game.new(X: false, O: true)
game.play