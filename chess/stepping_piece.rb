module SteppingPiece
  def moves
    positions = possible_positions
    positions.select {|pos| valid_move?(pos)}
  end

  def possible_positions
    # returns all possible move positions (valid and invalid)
    MOVES.map do |x, y|
      new_x = x + @pos[0]
      new_y = y + @pos[1]
      [new_x, new_y]
    end
  end
end
