module DarkDragon
  class Output
    def self.write(output_path, new_content)
      if output_path.empty?
        puts new_content
      else
        File.write(output_path, new_content)
      end
    end
  end
end
