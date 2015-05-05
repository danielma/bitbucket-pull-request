require 'spec_helper'

describe BitbucketPullRequest::Remotes do
  before do
    expect(described_class).to receive(:get_remotes_raw).and_return(remotes)
  end

  describe 'bitbucket repo' do
    let(:remotes) do
%(origin	https://danielma@bitbucket.org/hrock/hrockchurch.com.git (fetch)
origin	https://danielma@bitbucket.org/hrock/hrockchurch.com.git (push)
)
    end

    it 'gets remotes' do
      expect(described_class::remote_path).to eq 'hrock/hrockchurch.com'
    end
  end

  describe 'other repo' do
    let(:remotes) do
      %(origin	https://github.com/danielma/bitbucket-pull-request.git (fetch)
origin	https://github.com/danielma/bitbucket-pull-request.git (push)
)
    end

    it 'throws an error' do
      expect { described_class::remote_path }.to raise_error(/bitbucket/)
    end
  end

  describe 'no remotes' do
    let (:remotes) do
      %()
    end

    it 'throws an error' do
      expect { described_class::remote_path }.to raise_error(/origin/)
    end
  end
end
