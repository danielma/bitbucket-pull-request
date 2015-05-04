require 'spec_helper'

describe Bitbucket::Pull::Request do
  it 'has a version number' do
    expect(Bitbucket::Pull::Request::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
