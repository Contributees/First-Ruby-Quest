# frozen_string_literal: true

class GithubApi
  def initialize
    @client = Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'], per_page: 100)
  end

  def search_issues
    @client.search_issues(%(language:ruby is:issue state:open label:good-first-issue,"Good First Issue",beginner,beginner-friendly sort:created))
  end
end
