class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.string :url
      t.string :title
      t.string :repo_name
      t.integer :repo_stars
      t.integer :repo_url
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.integer :category
      t.boolean :assigned, default: false
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
