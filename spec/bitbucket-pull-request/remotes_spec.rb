require 'spec_helper'

describe BitbucketPullRequest::Remotes do
  before do
    expect(described_class).to receive(:get_remotes_raw).and_return(remotes)
  end

  describe 'bitbucket repo' do
    describe 'with user' do
      let(:remotes) do
  %(origin	https://danielma@bitbucket.org/danielma/my-repo.git (fetch)
  origin	https://danielma@bitbucket.org/danielma/my-repo.git (push)
  )
      end

      it 'gets remotes' do
        expect(described_class::remote_path).to eq 'danielma/my-repo'
      end
    end

    describe 'without user' do
      let(:remotes) do
        %(origin	https://bitbucket.org/danielma/my-repo.git (fetch)
origin	https://bitbucket.org/danielma/my-repo.git (push)
        )
      end

      it 'gets remote' do
        expect(described_class::remote_path).to eq 'danielma/my-repo'
      end
    end

    describe 'without .git' do
      let(:remotes) do
        %(origin	https://bitbucket.org/danielma/my-repo (fetch)
origin	https://bitbucket.org/danielma/my-repo (push)
        )
      end

      it 'gets remote' do
        expect(described_class::remote_path).to eq 'danielma/my-repo'
      end
    end

    describe 'with user, without .git' do
      let(:remotes) do
        %(origin	https://danielma@bitbucket.org/danielma/my-repo (fetch)
origin	https://danielma@bitbucket.org/danielma/my-repo (push)
        )
      end

      it 'gets remote' do
        expect(described_class::remote_path).to eq 'danielma/my-repo'
      end
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
