require 'spec_helper'

describe DarkDragon::Potion do
  let(:input) { "a\ns\nd\nf" }

  describe '#drink' do
    [
      {
        desc: '`line` is the current line',
        command: 'line',
        output: "a\ns\nd\nf",
      },
      {
        desc: '`line_number` is the 1-indexed line number',
        command: 'line_number',
        output: "1\n2\n3\n4",
      },
      {
        desc: 'can handle conditionals',
        command: 'line if line_number.even?',
        output: "s\nf"
      },
      {
        desc: 'evals the command',
        command: 'line * 3',
        output: "aaa\nsss\nddd\nfff",
      },
      {
        desc: 'can delete lines',
        command: 'line_number <= 2 ? nil : line',
        output: "d\nf",
      },
      {
        desc: 'can count lines',
        command: 'count',
        output: "4",
      },
      {
        desc: 'can count lines with conditionals',
        command: 'count if line_number.odd?',
        output: "2",
      },
    ].each do |example|
      it example[:desc] do
        expect(described_class.drink(input, example[:command])).to eq example[:output]
      end
    end
  end
end
