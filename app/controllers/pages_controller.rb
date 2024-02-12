# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :guide

  def dashboard
    @bookmarked_issues = Bookmark.includes(issue: :tags).where(user_id: current_user.id)

    filter_bookmarked_issues_by_search_term
    filter_bookmarked_issues_by_assigned
    filter_bookmarked_issues_by_label

    paginate_and_sort_bookmarked_issues
  end

  private

  def filter_bookmarked_issues_by_search_term
    return unless params[:search].present?

    search_term = params[:search].strip.downcase
    @bookmarked_issues = @bookmarked_issues.select do |bookmark|
      issue = bookmark.issue
      issue.title.downcase.include?(search_term) ||
        issue.repo_name.downcase.include?(search_term) ||
        issue.tags.any? { |tag| tag.name.downcase.include?(search_term) }
    end
  end

  def filter_bookmarked_issues_by_assigned
    return unless params[:assigned].present?

    assigned_value = params[:assigned] == 'true'
    @bookmarked_issues = @bookmarked_issues.select do |bookmark|
      issue = bookmark.issue
      issue.assigned == assigned_value
    end
  end

  def filter_bookmarked_issues_by_label
    return unless params[:label].present?

    label_name = params[:label]
    @bookmarked_issues = @bookmarked_issues.select do |bookmark|
      issue = bookmark.issue
      issue.tags.any? { |tag| tag.name.downcase == label_name.downcase }
    end
  end

  def paginate_and_sort_bookmarked_issues
    @bookmarked_issues = @bookmarked_issues.sort_by(&:created_at).reverse
    @bookmarked_issues = Kaminari.paginate_array(@bookmarked_issues).page(params[:page]).per(6)
  end
end
