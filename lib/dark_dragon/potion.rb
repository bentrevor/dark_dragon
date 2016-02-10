module DarkDragon
  class Potion
    def self.drink(lines, command)
      lines.each_with_index.map do |line, line_number|
        line_number += 1
        result = eval command

        result && result.to_s
      end.compact
    end
  end
end
