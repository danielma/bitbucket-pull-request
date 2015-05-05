module BitbucketPullRequest
  class Branch
    def self.get
      self.get_raw.chomp
    end

    def self.get_raw
      `git rev-parse --abbrev-ref HEAD`
    end
  end
end
