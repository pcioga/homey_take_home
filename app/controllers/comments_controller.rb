# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_project

  def create
    unless @project.users.include?(current_user)
      redirect_to @project, alert: 'You are not a member of this project and cannot comment.' and return
    end

    @comment = @project.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @project, notice: 'Comment added successfully.'
    else
      redirect_to @project, alert: 'Failed to add comment.'
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
