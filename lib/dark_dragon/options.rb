module DarkDragon
  class Options
    attr_accessor :input_path, :command, :output_path, :backup_path

    def self.parse_ARGV(argv)
      raise StandardError unless correctly_formatted?(argv)

      output_path = flag_value(argv, 'o')
      backup_path = flag_value(argv, 'i')
      input_path = argv[0]
      command = argv[1]

      output_path = input_path if i_flag?(output_path, backup_path)

      new(input_path, command, output_path, backup_path)
    end

    def initialize(input_path, command, output_path='', backup_path='')
      self.input_path = input_path
      self.command = command
      self.output_path = output_path
      self.backup_path = backup_path
    end

    private

    def self.flag_value(argv, flag)
      if flag_index = argv.index("-#{flag}")
        path = argv[flag_index + 1]
        2.times { argv.delete_at(flag_index) }
        path
      else
        ''
      end
    end

    def self.i_flag?(output_path, backup_path)
      output_path.empty? && !backup_path.empty?
    end

    def self.correctly_formatted?(argv)
      correct_length?(argv) && !too_many_flags?(argv)
    end

    def self.correct_length?(argv)
      [2,4].include?(argv.length)
    end

    def self.too_many_flags?(argv)
      argv.include?('-i') && argv.include?('-o')
    end
  end
end
