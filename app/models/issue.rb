# frozen_string_literal: true

# Purpose: Issue model. It has many bookmarks, comments, issue_tags and tags.
class Issue < ApplicationRecord
  include PgSearch::Model

  belongs_to :user, optional: true
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :issue_tags, dependent: :destroy
  has_many :tags, through: :issue_tags

  validates :title, presence: true
  validates :category, presence: true
  # only for open_source issues
  # several call_to_action issues can have an empty string as a url
  validates :url, uniqueness: true, if: :open_source?
  validates :url, presence: true, if: :open_source?
  validates :repo_name, presence: true, if: :open_source?
  validates :repo_url, presence: true, if: :open_source?
  validates :gh_id, presence: true, if: :open_source?
  # only for call_to_action issues
  validates :description, presence: true, if: :call_to_action?
  validates :user_id, presence: true, if: :call_to_action?

  enum category: %i[open-source call_to_action]

  scope :assigned, -> { where.not(user_id: nil) }
  scope :available, -> { where(available: true) }

  pg_search_scope :search_by_keyword, against: %i[title description repo_name]
end
