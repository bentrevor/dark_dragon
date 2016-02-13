module DarkDragon
  class Potion
    def self.drink(contents, command)
      new(contents, command).drink
    end

    attr_accessor :contents, :command, :line_count, :count_was_called

    def initialize(contents, command)
      self.contents = contents
      self.command = command
      self.line_count = 0
      self.count_was_called = false
    end

    def drink
      lines = contents.split("\n")

      new_lines = lines.each_with_index.map do |line, line_number|
        line_number += 1
        eval command
      end

      return line_count.to_s if count_was_called

      new_lines.compact.map(&:to_s).join("\n")
    end

    private

    def count
      self.count_was_called = true
      self.line_count += 1
    end
  end
end
