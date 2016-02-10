require 'spec_helper'

describe DarkDragon::Output do
  it 'writes to stdout if there is no output_file' do
    expect($stdout).to receive(:puts).exactly(3).times

    described_class.write(['asdf', 'qwer', 'jkl;'])
  end

  it 'only supports stdout for now' do
    expect {
      described_class.write(['asdf', 'qwer', 'jkl;'], 'output/file/path')
    }.to raise_error(StandardError)
  end
end
