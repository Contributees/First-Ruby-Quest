# frozen_string_literal: true

class IssueGenerator
  def initialize(issue)
    @issue = issue
  end

  def create
    issue_attributes = get_necessary_attributes
    preexisting_issue = Issue.find_by(github_id: @issue.id)

    if preexisting_issue
      preexisting_issue.update(issue_attributes)
      preexisting_issue
    else
      new_issue_attributes = issue_attributes.merge({ gh_issue_created_at: @issue.created_at, category: 'open-source',
                                                      github_id: @issue.id })
      new_issue = Issue.create!(new_issue_attributes)
      tags = @issue.labels.pluck(:name)
      tags.each do |tag|
        t = Tag.find_or_create_by(name: tag)
        IssueTag.create(issue_id: new_issue.id, tag_id: t.id)
      end
      new_issue
    end
  end

  private

  def get_necessary_attributes
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
end
