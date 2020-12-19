current_path = "./" + File.dirname(__FILE__ )

require current_path + "/game.rb"
require current_path + "/result_printer"
require current_path + "/word_reader.rb"

reader = WordReader.new

slovo = reader.read_from_file

game = Game.new(slovo)
printer = ResultPrinter.new



while game.status == 0 do
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
