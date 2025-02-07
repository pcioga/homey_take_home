# frozen_string_literal: true

# == Schema Information
#
# Table name: projects
#
#  id                 :integer          not null, primary key
#  description        :string
#  name               :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  project_manager_id :integer
#
class Project < ApplicationRecord
  # Associations
  has_many :project_users
  has_many :users, through: :project_users
  has_many :comments, dependent: :destroy
  has_many :status_changes, dependent: :destroy
  belongs_to :project_manager, class_name: 'User'

  # Validations
  validates :name, presence: true
  validates :project_manager, presence: true

  def status
    status_changes.order(created_at: :asc)&.last&.status || 'not_started'
  end
end
