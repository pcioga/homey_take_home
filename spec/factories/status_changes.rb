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
FactoryBot.define do
  factory :status_change do
    association :project
    association :user
    status { StatusChange.statuses.keys.sample }
  end
end
