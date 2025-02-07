# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StatusChangesController, type: :controller do
  let(:project_manager) { create(:user) }
  let(:other_user) { create(:user) }
  let(:project) { create(:project, project_manager:) }
  let(:valid_attributes) { { status: 'completed' } }

  before do
    allow(controller).to receive(:current_user).and_return(current_user)
  end

  describe 'POST #create' do
    context 'when the user is the project manager' do
      let(:current_user) { project_manager }

      it 'creates a new status change and redirects' do
        expect do
          post :create, params: { project_id: project.id, status_change: valid_attributes }
        end.to change(StatusChange, :count).by(1)

        expect(response).to redirect_to(project)
        expect(flash[:notice]).to eq('Status updated successfully.')
      end
    end

    context 'when the user is not the project manager' do
      let(:current_user) { other_user }

      it 'does not create a status change and redirects with an error' do
        expect do
          post :create, params: { project_id: project.id, status_change: valid_attributes }
        end.not_to change(StatusChange, :count)

        expect(response).to redirect_to(project)
        expect(flash[:alert]).to eq('Only the project manager can update the status.')
      end
    end
  end
end
