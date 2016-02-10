require_relative 'version'
require 'dark_dragon/options.rb'
require 'dark_dragon/output.rb'
require 'dark_dragon/potion.rb'

module DarkDragon
  def self.run(args)
    options = Options.from_args(args)

    # TODO won't work for gigantic files
    lines = File.read(options.input_path).split("\n")

    new_lines = Potion.drink(lines, options.command)

    Output.write(new_lines, options.output_file)
  end
end
