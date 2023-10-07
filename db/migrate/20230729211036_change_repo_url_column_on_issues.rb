class ChangeRepoUrlColumnOnIssues < ActiveRecord::Migration[7.0]
  def change
    change_column :issues, :repo_url, :string
  end
end
