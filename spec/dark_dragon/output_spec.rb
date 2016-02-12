require 'spec_helper'

describe DarkDragon::Output do
  let(:lines) { ['asdf', 'qwer', 'zxcv'] }
  let(:content) { lines.join }
  let(:filepath) { 'path/to/file' }

  it 'writes to stdout if there is a blank output_file' do
    expect($stdout).to receive(:puts).with(lines)

    described_class.write('', lines)
  end

  it 'writes to a file' do
    expect(File).to receive(:write).with(filepath, content)

    described_class.write(filepath, lines)
  end
end
