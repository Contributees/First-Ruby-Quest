# frozen_string_literal: true

class IssueGenerator
  def initialize(issue)
    @issue = issue
  end

  def create
    issue_attributes = extract_issue_details
    existing_issue = Issue.find_by(github_id: @issue.id)

    if existing_issue
      existing_issue.update(issue_attributes)
    else
      new_issue_attributes = issue_attributes.merge(
        gh_issue_created_at: @issue.created_at,
        category: 'open-source',
        github_id: @issue.id
      )

      new_issue = Issue.create(new_issue_attributes)
      create_tags(new_issue)
      new_issue
    end
  end

  private

  def extract_issue_details
    issue_url = @issue.html_url
    gh_url = issue_url.sub(%r{/issues/\d+$}, '')
    repo_name = gh_url.sub('https://github.com/', '')

    {
      url: issue_url,
      title: @issue.title,
      description: @issue.body,
      assigned: !@issue.assignee.nil?,
      gh_url:,
      repo_name:,
      available: true
    }
  end

  def create_tags(issue)
    tag_names = issue.labels.pluck(:name)
    tag_names.each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name)
      IssueTag.create(issue:, tag:)
    end
  end
end
