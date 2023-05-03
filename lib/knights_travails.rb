module Chess
  class Board
    attr_accessor :grid, :knight

    def initialize
      @grid = Array.new(8) { Array.new(8) }
      @knight = Knight.new
    end
  end

  class Knight
    attr_accessor :start_row, :start_column

    def initialize(start_row = 0, start_column = 0)
      @start_row = start_row
      @start_column = start_column
    end
  end
end

include Chess

board = Board.new
puts board.grid[0][0]