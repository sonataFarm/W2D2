require_relative "piece.rb"
class Board

  DIMENSIONS = 8
  PAWN = Piece.new(:pawn)
  BISHOP = Piece.new(:bishop)
  CASTLE = Piece.new(:castle)
  KNIGHT = Piece.new(:knight)
  KING = Piece.new(:king)
  QUEEN = Piece.new(:queen)
  EMPTY = NullPiece.new

  NEW_GAME = [
    [BISHOP, CASTLE,KNIGHT,KING,QUEEN,KNIGHT,CASTLE,BISHOP],
    [PAWN, PAWN, PAWN, PAWN, PAWN, PAWN, PAWN, PAWN]       ,
    [EMPTY] * 8                                            ,
    [EMPTY] * 8                                            ,
    [EMPTY] * 8                                            ,
    [EMPTY] * 8                                            ,
    [PAWN, PAWN, PAWN, PAWN, PAWN, PAWN, PAWN, PAWN]       ,
    [BISHOP, CASTLE,KNIGHT,KING,QUEEN,KNIGHT,CASTLE,BISHOP]
  ]

  attr_reader :grid

  def initialize(grid = NEW_GAME)
    @grid = grid
  end

  def move_piece(pos1, pos2)
    raise "There is no piece at #{pos1} :(" if empty?(pos1)
    raise "#{pos2} is already occupied" unless empty?(pos2)

    self[pos2] = self[pos1]
    self[pos1] = EMPTY
  end

  def empty?(pos)
    self[pos] == EMPTY
  end

  def [](pos)
      #pos is [x,y]
      x, y = pos
      @grid[x][y]
  end

  def []=(pos, val)
      #pos is [x,y]
      x, y = pos
      @grid[x][y] = val
  end

  def in_bounds?(pos)
    pos.all? {|coord| coord < DIMENSIONS && coord >= 0 }
  end

end
