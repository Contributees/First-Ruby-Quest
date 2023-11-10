class CreateIssuesJob
  include Sidekiq::Job

  def perform
    issues = GithubApi.new.search_issues.items
    issues.each { |issue| IssueGenerator.new(issue).create }
  end
end
