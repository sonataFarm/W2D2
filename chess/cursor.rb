require "io/console"

KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [-1, 0],
  right: [1, 0],
  up: [0, -1],
  down: [0, 1]
}

class Cursor
  COLORS = [:yellow, :blue]

  attr_reader :cursor_pos, :board, :color

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
    @color = COLORS.first
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end

  def handle_key(key)
    case key
    when :return, :space
      toggle_selected
      @cursor_pos
    when :left, :right, :up, :down then update_pos(MOVES[key])
    when :ctrl_c then Process.exit(0)
    end
  end

  def update_pos(diff)
    new_pos = shift_pos(@cursor_pos, diff)
    @cursor_pos = new_pos if board.in_bounds?(new_pos)
    nil
  end

  def toggle_selected
    @color = COLORS.rotate!.first
  end

  def shift_pos(pos, shift)
    x = pos.first + shift.first
    y = pos.last + shift.last
    [x, y]
  end

end
