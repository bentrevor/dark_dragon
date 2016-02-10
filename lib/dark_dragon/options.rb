module DarkDragon
  class Options
    attr_accessor :input_path, :command, :output_file

    def self.from_args(args)
      new(args[0], args[1])
    end

    def initialize(path, command)
      self.input_path = path
      self.command = command
    end
  end
end
