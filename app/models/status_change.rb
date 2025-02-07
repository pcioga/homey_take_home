# frozen_string_literal: true

# == Schema Information
#
# Table name: status_changes
#
#  id         :integer          not null, primary key
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_status_changes_on_project_id  (project_id)
#  index_status_changes_on_user_id     (user_id)
#
# Foreign Keys
#
#  project_id  (project_id => projects.id)
#  user_id     (user_id => users.id)
#
class StatusChange < ApplicationRecord
  # Associations
  belongs_to :project
  belongs_to :user

  # Validations
  validates :status, presence: true

  enum status: {
    not_started: 0,
    in_progress: 1,
    on_hold: 2,
    in_review: 3,
    completed: 4,
    archived: 5
  }
end
