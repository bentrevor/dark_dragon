module DarkDragon
  class Output
    def self.write(lines, output_filepath=nil)
      if output_filepath
        raise StandardError
      else
        puts lines
      end
    end
  end
end
