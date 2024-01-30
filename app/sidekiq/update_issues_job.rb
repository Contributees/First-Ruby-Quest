class UpdateIssuesJob
  include Sidekiq::Job

  def perform
    issues = GithubApi.new(per_page: 100).search_issues(open_state_only: false).items
    issues.each { |issue| IssueProcessor.new(issue).update }
  end
end
