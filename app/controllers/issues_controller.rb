class IssuesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @tags = Tag.all.map { |tag| { value: tag.id, name: tag.name } }.to_json
    @issues = Issue.available.order(created_at: :desc)

    if params[:issue].present? && params[:issue][:assigned].present?
      @issues = @issues.where(assigned: params[:issue][:assigned])
    end

    if params[:issue].present? && params[:issue][:category].present?
      @issues = @issues.where(category: params[:issue][:category])
    end

    if params[:tags].present?
      @issues = @issues.joins(:tags).where(tags: { id: JSON.parse(params[:tags]).map { |tag| tag["value"].to_i } })
    end

    @issues = @issues.search_by_keyword(params[:query]) if params[:query].present?
    @issues = @issues.page(params[:page]).per(6)
  end
end
