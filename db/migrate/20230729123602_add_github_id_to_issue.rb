class AddGithubIdToIssue < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :github_id, :bigint
  end
end
