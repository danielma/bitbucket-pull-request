module BitbucketPullRequest
  def get_remotes
    %x{git remote -v}
  end
end
