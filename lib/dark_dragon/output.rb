module DarkDragon
  class Output
    def self.write(options, new_content)
      if options.output_path.empty?
        puts new_content
      else
        File.write(options.output_path, new_content)
      end
    end
  end
end
