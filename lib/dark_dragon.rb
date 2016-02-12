require_relative 'version'
require 'dark_dragon/options.rb'
require 'dark_dragon/output.rb'
require 'dark_dragon/potion.rb'

module DarkDragon
  def self.run(argv)
    options = Options.from_ARGV(argv)
    file_contents = File.read(options.input_path) # TODO won't work for gigantic files
    new_content = Potion.drink(file_contents, options.command)
    Output.write(options.output_filepath, new_content)
  end
end
