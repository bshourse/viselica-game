class WordReader

  def read_from_file

    current_path = File.dirname(__FILE__ )
    file_path = current_path + "/data/words.txt"

    if File.exists?(file_path)
      file = File.new(file_path)
      file_array = file.readlines
      file.close
      return file_array.sample.chomp
    else
      return nil
    end

  end
end
