# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:github]

  # Write associations and validations here
  has_many :issues, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, uniqueness: true, presence: true
  validates :gh_uid, uniqueness: true, presence: true
  validates :gh_url, uniqueness: true, allow_blank: true

  def bookmark!(issue)
    bookmarks << Bookmark.create(issue:)
  end

  def self.from_omniauth(omniauth_params)
    info = omniauth_params.info
    User.find_or_create_by(gh_uid: omniauth_params["uid"]) do |user|
      user.username = info["nickname"]
      user.gh_url = info.dig("urls", "GitHub")
      user.image_url = info["image"]
    end
  end
end
