module Chess
  class Board
    def initialize
    end

    def possible_moves(position)
      moves = []
      moves.push([position[0] + 2, position[1] + 1])
      moves.push([position[0] + 2, position[1] - 1])
      moves.push([position[0] + 1, position[1] + 2])
      moves.push([position[0] + 1, position[1] - 2])
      moves.push([position[0] - 2, position[1] + 1])
      moves.push([position[0] - 2, position[1] - 1])
      moves.push([position[0] - 1, position[1] + 2])
      moves.push([position[0] - 1, position[1] - 2])

      moves.select {|move| valid_move?(move)}.map {|move| Knight.new(move)}
    end

    def valid_move?(move)
      return false unless move[0].between?(0, 7) && move[1].between?(0, 7)
      true
    end

    def knight_moves(start, finish)
      knight = Knight.new(start)
      queue = [knight]
      until queue.empty?
        current = queue.shift
        return current.find_path if current.position == finish
        current.children = possible_moves(current.position)
        current.children.each do |child|
          child.parent = current
          queue.push(child)
        end
      end
    end
  end

  class Knight
    attr_accessor :children, :parent, :position

    def initialize(position, parent = nil)
      @position = position
      @children = []
      @parent = parent
    end

    def find_path
      path = []
      current = self
      while current
        path.unshift(current.position)
        current = current.parent
      end
      
      path
    end
  end
end

include Chess

board = Board.new
p board.knight_moves([3,3],[4,3])