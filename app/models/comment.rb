# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :issue

  validates :content, presence: true

  broadcasts_to ->(comment) { [comment.issue, "comments"] }, inserts_by: :append
end
