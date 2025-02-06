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
require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'associations' do
    it { should have_many(:project_users) }
    it { should have_many(:users).through(:project_users) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:status_changes).dependent(:destroy) }
    it { should belong_to(:project_manager).class_name('User') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:project_manager) }
  end
end
