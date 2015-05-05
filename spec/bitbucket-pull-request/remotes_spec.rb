require 'spec_helper'

describe BitbucketPullRequest do
  it 'gets remotes' do
    expect(BitbucketPullRequest::get_remotes).to eq 'origin'
  end
end
