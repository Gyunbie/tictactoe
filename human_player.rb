class HumanPlayer
  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position
    print "Player Mark: #{@mark}. Enter the coordinates with a space between > "
    pos_raw = gets.chomp
    pos_arr = pos_raw.split("")
    if pos_arr.size != 3 || !pos_arr[0].to_i.is_a?(Integer) || !pos_arr[2].to_i.is_a?(Integer) || pos_arr[1] != " "
      puts "You entered in wrong format."
      get_position
    end
    pos = pos_raw.split(" ")
    pos.map { |ele| ele.to_i }
  end
end