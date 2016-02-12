module DarkDragon
  class Options
    attr_accessor :input_path, :command, :output_path, :backup_path

    def self.from_ARGV(argv)
      raise StandardError unless [2,4].include?(argv.length)
      output_path = ''
      backup_path = ''

      if flag_index = argv.index('-o')
        output_path = argv[flag_index + 1]
        2.times { argv.delete_at(flag_index) }
      end

      if flag_index = argv.index('-i')
        backup_path = argv[flag_index + 1]
        2.times { argv.delete_at(flag_index) }
      end

      new(argv[0], argv[1], output_path, backup_path)
    end

    def initialize(path, command, output_path, backup_path)
      self.input_path = path
      self.command = command
      self.output_path = output_path
      self.backup_path = backup_path
    end
  end
end
