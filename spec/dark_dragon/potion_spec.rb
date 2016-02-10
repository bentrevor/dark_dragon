require 'spec_helper'

describe DarkDragon::Potion do
  describe '#drink' do
    specify '`line` is the full text of the line' do
      lines = ['a','b','c','d']
      command = 'line'

      new_lines = described_class.drink(lines, command)

      expect(new_lines).to eq lines
    end

    specify '`line_number` is the 1-indexed line number' do
      lines = ['a','b','c','d']
      command = 'line_number'

      new_lines = described_class.drink(lines, command)

      expect(new_lines).to eq ['1','2','3','4']
    end

    it 'can handle conditionals' do
      lines = ['a','b','c','d']
      command = 'line if line_number.even?'

      new_lines = described_class.drink(lines, command)

      expect(new_lines).to eq ['b','d']
    end

    it 'evals the command' do
      lines = ['a','b','c','d']
      command = 'line * 3'

      new_lines = described_class.drink(lines, command)

      expect(new_lines).to eq ['aaa','bbb','ccc','ddd']
    end
  end
end
