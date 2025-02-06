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
require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
