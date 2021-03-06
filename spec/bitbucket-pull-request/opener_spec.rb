require 'spec_helper'

describe BitbucketPullRequest::Opener do
  include_context 'git stubs'

  describe 'source_param' do
    subject { described_class.source_param }

    it { is_expected.to eq 'crew%2Fcool-repo%3A%3Anew-feature' }
  end

  describe 'dest_param' do
    subject { described_class.dest_param }

    it { is_expected.to eq 'crew%2Fcool-repo%3A%3Amaster' }
  end

  describe 'full_url' do
    subject { described_class.full_url }

    it { is_expected.to start_with 'https://bitbucket.org/crew/cool-repo/pull-request/new?' }
  end
end
