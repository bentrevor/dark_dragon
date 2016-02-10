require 'spec_helper'

describe DarkDragon::Options do
  describe '#from_args' do
    context 'stdout' do
      let(:options) { described_class.from_args(['path/to/file', 'some command']) }

      it 'takes the path to the input file as the first argument' do
        expect(options.input_path).to eq 'path/to/file'
      end

      it 'takes the command to run as the second argument' do
        expect(options.command).to eq 'some command'
      end

      it 'leaves the output_file blank' do
        expect(options.output_file).to eq nil
      end
    end

    # eventually will have three outputs:
    # no flag   : stdout
    # -i        : modify input file and create backup
    # -o <file> : new file

    context 'new file' do
      it 'takes an argument `-o path/to/new/file`'
      it 'can put the argument anywhere in the args'
      # dark_dragon -o new/path old/path "command"
      # dark_dragon old/path -o new/path "command"
      # dark_dragon old/path "command" -o new/path
    end

    context 'overwrite' do
      it 'takes an argument like sed: `-i path/to/backup/file`'
      it 'can put the argument anywhere in the args'
    end
  end
end
