# frozen_string_literal: true

class PagesController < ApplicationController
  def dashboard
    @bookmarked_issues = Bookmark.includes(issue: :tags).where(user_id: current_user.id)

    if params[:search].present?
      search_term = params[:search].strip.downcase
      @bookmarked_issues = @bookmarked_issues.select do |bookmark|
        issue = bookmark.issue
        issue.title.downcase.include?(search_term) ||
          issue.repo_name.downcase.include?(search_term) ||
          issue.tags.any? { |tag| tag.name.downcase.include?(search_term) }
      end
    end

    if params[:assigned].present?
      assigned_value = params[:assigned] == 'true'
      @bookmarked_issues = @bookmarked_issues.select do |bookmark|
        issue = bookmark.issue
        issue.assigned == assigned_value
      end
    end

    if params[:label].present?
      label_name = params[:label]
      @bookmarked_issues = @bookmarked_issues.select do |bookmark|
        issue = bookmark.issue
        issue.tags.any? { |tag| tag.name.downcase == label_name.downcase }
      end
    end

    @bookmarked_issues = @bookmarked_issues.sort_by(&:created_at).reverse
    @bookmarked_issues = Kaminari.paginate_array(@bookmarked_issues).page(params[:page]).per(6)
  end
end
