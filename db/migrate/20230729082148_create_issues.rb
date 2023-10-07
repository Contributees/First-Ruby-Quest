# frozen_string_literal: true

class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.boolean :assigned, default: false
      t.integer :category
      t.string :description
      t.bigint :gh_id
      t.datetime :gh_issue_created_at
      t.string :repo_name
      t.integer :repo_stars
      t.string :gh_url
      t.string :title
      t.integer :status, default: 0
      t.string :url
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
