class ResultPrinter

  def print_status(game)
    cls

    puts "Слово: #{get_word_for_print(game.letters, game.good_letters)}"
    puts "Ошибки: #{game.bad_letters.join(", ")}"

    if game.status == -1
      puts "Вы проиграли! :-("
      puts "Загаданное слово было: " + game.letters.join("")
    elsif game.status == 1
      puts "Вы выиграли!!! Поздравляем!!!"
    else
      puts "У вас осталось ошибок: " + (7 - game.errors).to_s
    end
  end

  def cls
    system "clear"
  end

  def get_word_for_print(letters, good_letters)
    result = ''

    for x in letters do
      if good_letters.include?(x)
        result += x + ' '
      else
        result += "__ "
      end
    end

      return result

  end
end
