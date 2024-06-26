class ChangeUsersTableToMoveToGithubOmniauth < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :email, :string
    remove_column :users, :encrypted_password, :string
    remove_column :users, :reset_password_token, :string
    remove_column :users, :reset_password_sent_at, :datetime
    remove_column :users, :remember_created_at, :datetime

    add_column :users, :gh_uid, :string, null: false
    add_column :users, :image_url, :string
  end
end
