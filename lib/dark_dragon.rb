require_relative 'version'
require 'dark_dragon/options.rb'
require 'dark_dragon/output.rb'
require 'dark_dragon/potion.rb'

module DarkDragon
  def self.run(args)
    options = Options.from_args(args)

    # TODO won't work for gigantic files
    file_contents = File.read(options.input_path)

    new_lines = Potion.drink(file_contents, options.command)

    Output.write(new_lines, options.output_file)
  end
end
