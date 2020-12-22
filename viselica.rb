require_relative 'game'
require_relative 'result_printer'
require_relative 'word_reader'

reader = WordReader.new

slovo = reader.read_from_file

game = Game.new(slovo)
printer = ResultPrinter.new

while game.status == 0 do
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
