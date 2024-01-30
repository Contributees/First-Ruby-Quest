class CreateIssuesJob
  include Sidekiq::Job

  def perform
    issues = GithubApi.new(per_page: 40).search_issues.items
    issues.each { |issue| IssueProcessor.new(issue).create }
  end
end
