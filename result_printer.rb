class ResultPrinter

  def initialize
    @status_image = []

    current_path = File.dirname(__FILE__ )
    counter = 0

    while counter <= 7 do
      file_name = current_path + "/images/#{counter}.txt"

      begin
        f = File.new(file_name)
        @status_image << f.read
        f.close
      rescue Errno::ENOENT => error
        @status_image << "\n [Файл не найден: #{error.message}] \n"
      end
      counter += 1
    end

  end

  def print_status(game)
    cls

    puts "Слово: #{get_word_for_print(game.letters, game.good_letters)}"
    puts "Ошибки: #{game.bad_letters.join(", ")}"

    print_viselica(game.errors)

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

  def print_viselica(errors)
    puts @status_image[errors]
  end
end
