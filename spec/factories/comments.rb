# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_comments_on_project_id  (project_id)
#  index_comments_on_user_id     (user_id)
#
# Foreign Keys
#
#  project_id  (project_id => projects.id)
#  user_id     (user_id => users.id)
#
FactoryBot.define do
  factory :comment do
    content { "This is a sample comment." }
    association :project
    association :user
  end
end
