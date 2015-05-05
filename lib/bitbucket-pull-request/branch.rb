module BitbucketPullRequest
  class Branch
    def self.get
      `git rev-parse --abbrev-ref HEAD`
    end
  end
end
