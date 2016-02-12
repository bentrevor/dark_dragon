require 'spec_helper'

describe DarkDragon::Output do
  let(:content) { "asdf\nqwer\nzxcv" }
  let(:path) { 'path/to/file' }

  it 'writes to stdout if there is a blank output_file' do
    expect($stdout).to receive(:puts).with(content)

    described_class.write('', content)
  end

  it 'writes to a file' do
    expect(File).to receive(:write).with(path, content)

    described_class.write(path, content)
  end
end
