# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @issue = Issue.find(params[:issue_id])
    @comments = @issue.comments
    attributes = comment_params.merge({ user_id: current_user.id, issue_id: @issue.id })
    @comment = Comment.new(attributes)

    if @comment.save
      notice = 'Your reply has been successfully posted!'
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = notice }
        format.html { redirect_to @issue, notice: }
      end
    else
      render 'issues/show', status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
