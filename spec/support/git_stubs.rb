shared_context 'git stubs' do
  let(:_remotes) do
%(origin	https://danielma@bitbucket.org/crew/cool-repo.git (fetch)
origin	https://danielma@bitbucket.org/crew/cool-repo.git (push)
)
  end

  let(:_branch) { "new-feature\n" }

  before(:each) do
    allow(BitbucketPullRequest::Remotes).to receive(:get_remotes_raw).and_return(_remotes)
    allow(BitbucketPullRequest::Branch).to receive(:get).and_return(_branch)
  end
end
