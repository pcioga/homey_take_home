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
require 'rails_helper'

RSpec.describe StatusChange, type: :model do
  describe 'associations' do
    it { should belong_to(:project) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:status) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(
      not_started: 0,
      in_progress: 1,
      on_hold: 2,
      in_review: 3,
      completed: 4,
      archived: 5
    ) }
  end
end
