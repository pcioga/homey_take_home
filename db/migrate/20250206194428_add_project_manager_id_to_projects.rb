class AddProjectManagerIdToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :project_manager_id, :integer
  end
end
