# frozen_string_literal: true

# == Schema Information
#
# Table name: project_users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_project_users_on_project_id  (project_id)
#  index_project_users_on_user_id     (user_id)
#
# Foreign Keys
#
#  project_id  (project_id => projects.id)
#  user_id     (user_id => users.id)
#
class ProjectUser < ApplicationRecord
  # Associations
  belongs_to :project
  belongs_to :user

  # Validations
  validates :project_id, uniqueness: { scope: :user_id }
end
