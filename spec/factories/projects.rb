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
FactoryBot.define do
  factory :project do
    name { 'Project Alpha' }
    association :project_manager, factory: :user
  end
end
