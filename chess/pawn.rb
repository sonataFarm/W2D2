# needs to know position
# needs konwledge of board state
# generate all possible places for Pawn
# color attribute as well!


class Pawn < Piece
  MOVES = [[0,1],[0,2],[0,-1],[0,-2]]
  KILL_MOVES = [[-1,-1],[1,1],[1,-1],[-1,1]]

  def initialize
    super(:pawn)
  end

  def moves

  end

end
