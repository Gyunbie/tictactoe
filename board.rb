class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, "_") }
  end

  def valid?(pos)
    range = *(1..3)
    return range.include?(pos[0]) && range.include?(pos[1])
  end

  def empty?(pos)
    @grid[pos[0] - 1][pos[1] - 1] == "_"
  end

  def place_mark(pos, mark)
    if !self.empty?(pos)
      raise "Not an empty position."
    elsif !valid?(pos)
      raise "Not a valid position."
    else
      @grid[pos[0] - 1][pos[1] - 1] = mark
    end
  end

  def print
    @grid.each do |row|
      line = ""
      row.each do |col|
        line += col.to_s
      end
      puts line
    end
  end

  def win_row?(mark)
    @grid.each do |row|
      return true if row == [mark, mark, mark]
    end
    return false
  end

  def win_col?(mark)
    (0..2).each do |col|
      if @grid[0][col] == mark && @grid[1][col] == mark && @grid[2][col] == mark
        return true
      end
    end
    return false
  end

  def win_diagonal?(mark)
    if @grid[0][0] == mark && @grid[1][1] == mark && @grid[2][2] == mark ||
      @grid[0][2] == mark && @grid[1][1] == mark && @grid[2][0] == mark
      return true
    end
    return false
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end
end