# frozen_string_literal: true

class StatusChangesController < ApplicationController
  before_action :set_project

  def create
    if current_user != @project.project_manager
      redirect_to @project, alert: 'Only the project manager can update the status.' and return
    end

    @status_change = @project.status_changes.new(status_change_params)
    @status_change.user = current_user

    if @status_change.save
      redirect_to @project, notice: 'Status updated successfully.'
    else
      redirect_to @project, alert: 'Failed to update status.'
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def status_change_params
    params.require(:status_change).permit(:status)
  end
end
