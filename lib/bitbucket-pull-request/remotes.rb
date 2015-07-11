module BitbucketPullRequest
  class Remotes
    def self.remote_match
      raw    = self.get_remotes_raw
      origin = raw.match(/^origin\s(.+?)\s\(\w+\)$/) || throw('No remote origin')

      origin[1].match(%r{(?:://)?(?:\w+@)?bitbucket\.org(?:/|:)(.+?)(?:\.git)?$})
    end

    def self.remote_path
      match = self.remote_match

      match ? match[1] : throw('Only works with bitbucket repositories')
    end

    def self.get_remotes_raw
      `git remote -v`
    end
  end
end
