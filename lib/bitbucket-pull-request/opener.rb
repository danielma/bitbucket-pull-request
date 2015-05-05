require 'open-uri'

module BitbucketPullRequest
  class Opener
    def self.open
      `open "#{self.full_url}"`
    end

    def self.full_url
      "#{self.root_url}#{self.path}/#{self.pull_request_path}"
    end

    def self.root_url
      "https://bitbucket.org/"
    end

    def self.path
      Remotes.remote_path
    end

    def self.branch
      Branch.get
    end

    def self.source_param
      "#{self.path}::#{self.branch}"
    end

    def self.dest_param
      "#{self.path}::master"
    end

    def self.pull_request_path
      URI::encode "pull-request/new?source=#{self.source_param}&dest=#{self.dest_param}"
    end
  end
end
