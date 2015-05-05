require 'spec_helper'

describe BitbucketPullRequest::Opener do
  before do
    expect(BitbucketPullRequest::Opener).to receive('path').and_return('danielma/cool-repo')
    expect(BitbucketPullRequest::Opener).to receive('branch').and_return('feature-branch')
  end

  describe 'pull_request_path' do
    expect(BitbucketPullRequest::Opener.pull_request_path).to eq 'blue'
  end
end
