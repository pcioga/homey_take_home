# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_users, only: %i[new create]
  before_action :set_project, only: %i[show]

  def index
    @projects = current_user.projects
  end

  def show
    @status = @project.status
    @comments = @project.comments.order(created_at: :desc)
    @status_changes = @project.status_changes.order(created_at: :desc)
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.managed_projects.new(project_params)

    if @project.save
      add_users_to_project
      redirect_to @project, notice: 'Project created successfully.'
    else
      flash.now[:error] = @project.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_users
    @users = User.where.not(id: current_user.id)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def add_users_to_project
    user_ids = user_params | [current_user.id]

    @project.users << User.where(id: user_ids) if user_ids
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def user_params
    params[:project][:user_ids].reject(&:blank?).map(&:to_i)
  end
end
