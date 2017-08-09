class King < Piece
  include SteppingPiece

  MOVES = [
    [-1, -1],
    [0, -1],
    [1, -1],
    [1, 0],
    [1, 1],
    [0,1],
    [-1,1],
    [-1,0]
  ]

  def valid_move?
    # invalid if off-board
    return false unless @board.in_bounds?(pos)
    return true if @board.empty?(pos)

    # else it's on the board and occupied.
    collision = @board[pos]
    if @color == collision.color
      false
    else
      true
    end
  end

end
