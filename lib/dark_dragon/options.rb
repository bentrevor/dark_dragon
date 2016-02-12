module DarkDragon
  class Options
    attr_accessor :input_path, :command, :output_filepath

    def self.from_ARGV(argv)
      output_filepath = ''

      if flag_index = argv.index('-o')
        output_filepath = argv[flag_index + 1]
        2.times { argv.delete_at(flag_index) }
      end

      new(argv[0], argv[1], output_filepath)
    end

    def initialize(path, command, output_filepath)
      self.input_path = path
      self.command = command
      self.output_filepath = output_filepath
    end
  end
end
