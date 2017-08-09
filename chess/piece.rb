class Piece
  attr_reader :type
  def initialize(type)
    @type = type
  end

  def ==(other_piece)
    self.type == other_piece.type
  end

  def moves

  end
end

class NullPiece < Piece
  def initialize
    @type = nil
  end
end
