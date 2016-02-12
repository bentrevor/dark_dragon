require 'spec_helper'

describe DarkDragon::Options do
  let(:options) { described_class.from_ARGV(argv) }

  describe '#from_ARGV' do
    context 'stdout' do
      let(:argv) { ['path/to/file', 'some command'] }

      it 'takes the path to the input file as the first argument' do
        expect(options.input_path).to eq 'path/to/file'
      end

      it 'takes the command to run as the second argument' do
        expect(options.command).to eq 'some command'
      end

      it 'leaves the output_filepath blank' do
        expect(options.output_filepath).to eq ''
      end
    end

    context 'new file' do
      let(:output_path) { 'path/to/new/file' }
      let(:argv) { ['path/to/file', 'some command', '-o', output_path] }

      it 'takes an argument `-o path/to/new/file`' do
        expect(options.output_filepath).to eq output_path
      end

      it 'can put the argument first, middle, or last' do
        options = described_class.from_ARGV(['-o', output_path, 'path', 'cmd'])
        expect(options.output_filepath).to eq output_path

        options = described_class.from_ARGV(['path', '-o', output_path, 'cmd'])
        expect(options.output_filepath).to eq output_path

        options = described_class.from_ARGV(['path', 'cmd', '-o', output_path])
        expect(options.output_filepath).to eq output_path
      end
    end

    # context 'overwrite' do
    #   it 'takes an argument like sed: `-i path/to/backup/file`'
    #   it 'can put the argument anywhere in the argv'
    # end
  end
end
