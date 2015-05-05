require 'spec_helper'

describe BitbucketPullRequest::Opener do
  before do
    expect(BitbucketPullRequest::Remotes).to receive(:get_remotes_raw).and_return(%(origin	https://danielma@bitbucket.org/hrock/hrockchurch.com.git (fetch)
origin	https://danielma@bitbucket.org/hrock/hrockchurch.com.git (push)
))
    expect(described_class).to receive('path').and_return('danielma/cool-repo')
    expect(described_class).to receive('branch').and_return('feature-branch')
  end

  describe 'pull_request_path' do
    expect(described_class.pull_request_path).to eq 'blue'
  end

  describe 'source_param' do
    expect(described_class.source_param).to eq 'source='
  end
end
