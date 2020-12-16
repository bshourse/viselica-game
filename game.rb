=begin
Грубо говоря, все методы нашей виселицы v.1 по факту занимаются двумя вещами:

Меняют состояние игры
get_letters
get_user_input
check_input

Выводят что-то на экран (или чистят его)
get_word_for_print
print_status
cls

Это-то наталкивает нас на мысль, что игра по факту состоит
из двух глобальных частей: «внутренность игры» и «интерфейс вывода».
Отделим вывод информации для игрока от внутренней игровой логики.
=end
class Game

  def initialize(slovo)
    @letters = get_letters(slovo)
    @errors = 0
    @good_letters = []
    @bad_letters = []
    @status = 0
  end

  def get_letters(slovo)
    if slovo == nil || slovo == ""
      abort "Для игры введите загаданное слово в качестве аргумента при запуске программы"
    end

    return slovo.split("")
  end

  def ask_next_letter
    puts "Введите следующую букву"
    letter = ""
    while letter == "" do
      letter = STDIN.gets.chomp
    end

    next_step(letter)
  end

  def next_step(bukva)
    # Предварительная проверка: если статус игры равен 1 или -1, значит игра
    # закончена и нет смысла дальше делать шаг. Выходим из метода возвращая
    # пустое значение.
    if @status == -1 || @status == 1
      return
    end

    # Если введенная буква уже есть в списке "правильных" или "ошибочных" букв,
    # то ничего не изменилось, выходим из метода.
    if @good_letters.include?(bukva) || @bad_letters.include?(bukva)
      return
    end

    if @letters.include?(bukva)
      # Если в слове есть буква запишем её в число "правильных" буква
      @good_letters << bukva

      # Дополнительная проверка — угадано ли на этой букве все слово целиком.
      # Если да — меняем значение переменной @status на 1 — победа.
      if @good_letters.uniq.sort == @letters.uniq.sort
        @status = 1
      end
    else
      # Если в слове нет введенной буквы — добавляем эту букву в массив
      # «плохих» букв и увеличиваем счетчик ошибок.
      @bad_letters << bukva
      @errors += 1

      # Если ошибок больше 7 — статус игры меняем на -1, проигрыш.
      if @errors >= 7
        @status = -1
      end
    end
  end

  #Для каждого поля класса мы написали метод, который
  #будучи вызванным у экземпляра этого класса
  #возвращает значение одноимённой переменной класса. (геттеры)

  def status
    return @status
  end

  def errors
    return @errors
  end

  def letters
    return @letters
  end

  def good_letters
    return @good_letters
  end

  def bad_letters
    return @bad_letters
  end

end
