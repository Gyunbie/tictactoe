class Board
  def initialize(n)
    @size = n
    @size_index = @size - 1
    @grid = Array.new(@size) { Array.new(@size, "_") }
  end

  def valid?(pos)
    range = *(1..@size)
    return range.include?(pos[0]) && range.include?(pos[1])
  end

  def empty?(pos)
    @grid[pos[0] - 1][pos[1] - 1] == "_"
  end

  def legal_positions
    arr = []

    (1..@size).each do |row|
      (1..@size).each do |col|
        pos = [row, col]
        arr << pos if valid?(pos) && empty?(pos)
      end
    end
    arr
  end

  def place_mark(pos, mark)
    @grid[pos[0] - 1][pos[1] - 1] = mark
  end

  def print
    puts @grid.map { |i| i.join("") }
  end

  def win_row?(mark)
    @grid.any? do |row|
      row.all?(mark)
    end
  end

  def win_col?(mark)
    win = true
    
    (0..@size_index).any? do |col|
      (0..@size_index).all? { |row| @grid[row][col] == mark }
    end
  end

  def win_diagonal?(mark)
    l_to_r = (0..@size_index).all? { |i| @grid[i][i] == mark }
    r_to_l = (0..@size_index).all? { |i| @grid[0+i][@size_index-i] == mark }

    l_to_r || r_to_l
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end
end