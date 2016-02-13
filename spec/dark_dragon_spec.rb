require 'spec_helper'

describe DarkDragon do
  let(:path) { 'fake/path' }
  let(:command) { 'some command' }
  let(:file_contents) { "line1\nline2" }
  let(:new_content) { "new line1\nnew line2" }

  describe '#run' do
    before do
      allow(File).to receive(:read) { file_contents }
      allow(DarkDragon::Potion).to receive(:drink) { new_content }
      allow(DarkDragon::Output).to receive(:write)
    end

    it 'parses options from ARGV' do
      argv = [path, command]
      expect(DarkDragon::Options).to receive(:parse_ARGV).with(argv).and_call_original

      described_class.run(argv)
    end

    it 'reads a file' do
      expect(File).to receive(:read).with(path)

      described_class.run([path, command])
    end

    it 'drinks a potion' do
      expect(DarkDragon::Potion).to receive(:drink).with(file_contents, command)

      described_class.run([path, command])
    end

    it 'writes output' do
      options = instance_double(DarkDragon::Options, {input_path: '', command: ''})
      allow(DarkDragon::Options).to receive(:parse_ARGV) { options }
      expect(DarkDragon::Output).to receive(:write).with(options, new_content)

      described_class.run([path, command])
    end
  end
end
