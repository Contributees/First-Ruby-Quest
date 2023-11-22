# frozen_string_literal: true

class GithubApi
  def initialize(per_page:)
    @client = Octokit::Client.new(access_token: ENV.fetch("GITHUB_ACCESS_TOKEN"), per_page:)
  end

  def search_issues(open_state_only: true)
    query = <<~QUERY.squish
      language:ruby
      is:issue
      label:good-first-issue,"Good First Issue",beginner,beginner-friendly
      sort:created
      #{'state:open' if open_state_only}
    QUERY
    @client.search_issues(query)
  end
end
