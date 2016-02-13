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
        new_command = ''

        new_command = if command.include?('delete')
                        swap_if_and_unless(command)
                      else
                        command
                      end

        eval new_command
      end

      return line_count.to_s if count_was_called

      new_lines.compact.map(&:to_s).join("\n")
    end

    private

    def count
      self.count_was_called = true
      self.line_count += 1
    end

    def delete(line)
      line
    end

    def swap_if_and_unless(command)
      if command.include?(' if ')
        command.gsub(' if ', ' unless ')
      elsif command.include?(' unless ')
        command.gsub(' unless ', ' if ')
      else
        ''
      end
    end
  end
end
