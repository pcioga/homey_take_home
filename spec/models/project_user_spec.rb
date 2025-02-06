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
require 'rails_helper'

RSpec.describe ProjectUser, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:project) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    subject { create(:project_user) } # Creates a valid record before checking uniqueness

    it { is_expected.to validate_uniqueness_of(:project_id).scoped_to(:user_id) }
  end
end
