module BitbucketPullRequest
  class Remotes
    def self.remote_path
      raw    = self.get_remotes_raw
      origin = raw.match(/^origin\s(.+?)\s\(\w+\)$/) || throw('No remote origin')

      path = origin[1].match(%r{://(?:\w+@)?bitbucket\.org/(.+?)(\.git)?$})

      path ? path[1] : throw('Only works with bitbucket repositories')
    end

    def self.get_remotes_raw
      `git remote -v`
    end
  end
end
