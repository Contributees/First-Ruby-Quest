class BookmarksController < ApplicationController
  before_action :assign_issue

  def create
    current_user.bookmark!(@issue)
  end

  def destroy
    current_user.bookmarks.where(issue_id: @issue.id).destroy_all
  end

  private

  def assign_issue
    @issue = Issue.find(params[:issue_id])
  end
end
