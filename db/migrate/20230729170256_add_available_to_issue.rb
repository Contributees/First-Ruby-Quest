class AddAvailableToIssue < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :available, :boolean, default: true
  end
end
