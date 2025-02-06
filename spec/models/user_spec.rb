# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:project_users) }
    it { is_expected.to have_many(:projects).through(:project_users) }
    it { is_expected.to have_many(:managed_projects).class_name('Project') }
  end

  describe 'validations' do
    subject { create(:user) }  # Ensures uniqueness test works

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end
end
