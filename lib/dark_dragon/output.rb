module DarkDragon
  class Output
    def self.write(output_filepath, lines)
      if output_filepath.empty?
        puts lines
      else
        File.write(output_filepath, lines.join)
      end
    end
  end
end
