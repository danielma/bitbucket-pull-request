require 'spec_helper'

describe BitbucketPullRequest::Branch do
  include_context 'git stubs'

  describe 'get' do
    subject { described_class.get }

    it { is_expected.to eq 'new-feature' }
  end
end
