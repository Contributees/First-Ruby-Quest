# frozen_string_literal: true

class IssuesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @tags = Tag.all.map { |tag| { value: tag.id, name: tag.name } }.to_json
    @issues = Issue.where(available: true)
    if params[:issue].present? && params[:issue][:assigned].present?
      @issues = @issues.where(assigned: params[:issue][:assigned])
    end

    if params[:issue].present? && params[:issue][:category].present?
      @issues = @issues.where(category: params[:issue][:category])
    end

    if params[:tags].present?
      @issues = @issues.joins(:tags).where(tags: { id: JSON.parse(params[:tags]).map { |tag| tag['value'].to_i } })
    end

    @issues = @issues.search_by_keyword(params[:query]) if params[:query].present?
    @issues = @issues.order(created_at: :desc).page(params[:page]).per(6)
  end

  def show
    @issue = Issue.find(params[:id])
    @issue_author = @issue.user.username
    @comment = Comment.new
    @comments = Comment.where(issue_id: @issue.id)
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.category = :call_to_action
    if @issue.save
      redirect_to issue_path(@issue), notice: 'Your issue has been saved!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :url, :repo_name, :description, :user_id, :gh_url)
  end
end
