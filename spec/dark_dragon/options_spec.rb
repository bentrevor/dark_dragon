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

      it 'leaves the output_path blank' do
        expect(options.output_path).to eq ''
      end
    end

    # TODO shared examples
    context 'new file' do
      let(:output_path) { 'path/to/new/file' }
      let(:argv) { ['path/to/file', 'some command', '-o', output_path] }

      it 'takes an argument `-o path/to/new/file`' do
        expect(options.output_path).to eq output_path
      end

      it 'can put the argument first, middle, or last' do
        options = described_class.from_ARGV(['-o', output_path, 'path', 'cmd'])
        expect(options.output_path).to eq output_path

        options = described_class.from_ARGV(['path', '-o', output_path, 'cmd'])
        expect(options.output_path).to eq output_path

        options = described_class.from_ARGV(['path', 'cmd', '-o', output_path])
        expect(options.output_path).to eq output_path
      end
    end

    context 'overwrite' do
      let(:backup_path) { 'path/to/backup/file' }
      let(:argv) { ['path/to/file', 'some command', '-i', backup_path] }

      it 'takes an argument like sed: `-i path/to/backup/file`' do
        expect(options.backup_path).to eq backup_path
      end

      it 'can put the argument first, middle, or last' do
        options = described_class.from_ARGV(['-i', backup_path, 'path', 'cmd'])
        expect(options.backup_path).to eq backup_path

        options = described_class.from_ARGV(['path', '-i', backup_path, 'cmd'])
        expect(options.backup_path).to eq backup_path

        options = described_class.from_ARGV(['path', 'cmd', '-i', backup_path])
        expect(options.backup_path).to eq backup_path
      end
    end

    it 'throws an error for the wrong number of arguments' do
      expect {
        described_class.from_ARGV(['path'])
      }.to raise_error(StandardError)

      expect {
        described_class.from_ARGV(['path', 'cmd', '-i'])
      }.to raise_error(StandardError)

      expect {
        described_class.from_ARGV(['path', 'cmd', '-i', 'asdf', 'qwer'])
      }.to raise_error(StandardError)
    end
  end
end
