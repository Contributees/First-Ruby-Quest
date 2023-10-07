# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Write associations and validations here
  has_many :issues, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, uniqueness: true, presence: true
  validates :gh_url, uniqueness: true, allow_blank: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  validates :password, length: { minimum: 6 }
  def bookmark!(issue)
    bookmarks << Bookmark.create(issue:)
  end
end
