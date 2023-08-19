class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :issue

  validates :content, presence: true
end
