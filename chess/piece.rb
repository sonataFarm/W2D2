class Piece
  attr_reader :type, :color
  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  def ==(other_piece)
    self.class == other_piece.class
  end

  def moves

  end
end

class NullPiece < Piece
  include singleton

  def initialize
  end
end
