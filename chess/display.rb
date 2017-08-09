class Display
  BOARD_CLR =  :magenta
  CURSOR_CLR = :yellow

  PIECE_MAP = {
    pawn:   '[:PA]',
    bishop: '[:BI]',
    castle: '[:CA]',
    knight: '[:KN]',
    king:   '[:KG]',
    queen:  '[:QN]',
    nil =>  '[   ]'
  }

  attr_reader :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([1, 7], board)
  end

  def render
    board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |piece, col_idx|
        if @cursor.cursor_pos == [col_idx, row_idx]
          color = cursor.color
        else
          color = BOARD_CLR
        end
        print (PIECE_MAP[piece.type] + ' ').send(color)
      end
      puts
    end
    puts "cursor position = #{@cursor.cursor_pos}"
    nil
  end

  private
  attr_reader :board
end
