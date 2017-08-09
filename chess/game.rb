require_relative 'board'
require_relative 'cursor'
require_relative 'display'
require_relative 'piece'
require 'colorize'
b = Board.new
d = Display.new(b)
d.render

loop do
  system("clear")
  d.render
  d.cursor.get_input
end
