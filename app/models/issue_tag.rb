# frozen_string_literal: true

class IssueTag < ApplicationRecord
  belongs_to :issue
  belongs_to :tag
end
