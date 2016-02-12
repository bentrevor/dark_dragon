module DarkDragon
  class Potion
    def self.drink(contents, command)
      lines = contents.split("\n")

      new_lines = lines.each_with_index.map do |line, line_number|
        line_number += 1
        eval command
      end

      new_lines.compact.map(&:to_s).join("\n")
    end
  end
end
