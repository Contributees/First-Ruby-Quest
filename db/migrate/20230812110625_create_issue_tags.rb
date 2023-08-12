class CreateIssueTags < ActiveRecord::Migration[7.0]
  def change
    create_table :issue_tags do |t|
      t.references :issue, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
