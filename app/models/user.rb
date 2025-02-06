# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

  # Associations
  has_many :project_users
  has_many :projects, through: :project_users
  has_many :managed_projects, class_name: 'Project', foreign_key: 'project_manager_id'

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
