class ChangeUserIdColumnOnIssues < ActiveRecord::Migration[7.0]
  def change
    change_column_null :issues, :user_id, true
  end
end
