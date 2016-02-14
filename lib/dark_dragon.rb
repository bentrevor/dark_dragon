require_relative 'version'
require_relative 'dark_dragon/options.rb'
require_relative 'dark_dragon/output.rb'
require_relative 'dark_dragon/potion.rb'

module DarkDragon
  def self.run(argv)
    options = Options.parse_ARGV(argv)
    file_contents = File.read(options.input_path) # TODO won't work for gigantic files
    new_content = Potion.drink(file_contents, options.command)

    Output.write(options, new_content)
  end
end
