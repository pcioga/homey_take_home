# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_project
  before_action :set_comment, only: %i[edit update destroy]

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

  def edit; end

  def update
    unless @comment.user == current_user
      redirect_to @project, alert: 'You can only edit or delete your own comments.' and return
    end

    if @comment.update(comment_params)
      redirect_to @project, notice: 'Comment updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @project, notice: 'Comment deleted successfully.'
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_comment
    @comment = @project.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
