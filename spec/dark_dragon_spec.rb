require 'spec_helper'

describe DarkDragon do
  let(:path) { 'fake/path' }
  let(:command) { 'some command' }
  let(:file_contents) { "line1\nline2" }
  let(:new_lines) { ['new line1', 'new line2'] }

  describe '#run' do
    before do
      allow(File).to receive(:read) { file_contents }
      allow(DarkDragon::Potion).to receive(:drink) { new_lines }
      allow(DarkDragon::Output).to receive(:write)
    end

    it 'reads a file' do
      expect(File).to receive(:read).with(path)

      described_class.run([path, command])
    end

    it 'drinks a potion' do
      expect(DarkDragon::Potion).to receive(:drink).with(file_contents, command)

      described_class.run([path, command])
    end

    describe 'output' do
      it 'writes output to stdout when no file is given' do
        expect(DarkDragon::Output).to receive(:write).with('', new_lines)

        described_class.run([path, command])
      end

      it 'writes output to a file' do
        path = 'path/to/new/file'
        expect(DarkDragon::Output).to receive(:write).with(path, new_lines)

        described_class.run([path, command, '-o', path])
      end
    end
  end
end
