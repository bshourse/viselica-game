class WordReader

  def read_from_file

    current_path = File.dirname(__FILE__ )
    file_path = current_path + "/data/words.txt"

    begin
      file = File.new(file_path)
      file_array = file.readlines
      file.close
    rescue Errno::ENOENT => error
      puts "Файл не найден: #{error}"
      return nil
    end

      return file_array.sample.chomp
  end
end
