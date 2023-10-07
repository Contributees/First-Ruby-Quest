class AddGhIssueCreatedAtToIssue < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :gh_issue_created_at, :datetime
  end
end
