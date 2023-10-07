# frozen_string_literal: true

class GithubApi
  SEARCH_QUERY = %(
    language:ruby
    is:issue state:open
    label:good-first-issue,"Good First Issue",beginner,beginner-friendly
    sort:created
  )
  def initialize
    @client = Octokit::Client.new(access_token: ENV.fetch['GITHUB_ACCESS_TOKEN'], per_page: 100)
  end

  def search_issues
    @client.search_issues(SEARCH_QUERY)
  end
end
