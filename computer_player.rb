class ComputerPlayer
  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position(legal_positions)
    puts "Computer plays."
    pos = legal_positions.sample
  end
end