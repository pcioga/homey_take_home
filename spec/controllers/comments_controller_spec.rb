# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:project_member) { create(:user) }
  let(:non_member) { create(:user) }
  let(:project) { create(:project, users: [project_member]) }
  let(:valid_attributes) { { content: 'This is a comment.' } }

  before do
    allow(controller).to receive(:current_user).and_return(current_user)
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:current_user) { project_member }

      it 'creates a new comment and redirects' do
        expect do
          post :create, params: { project_id: project.id, comment: valid_attributes }
        end.to change(Comment, :count).by(1)

        expect(assigns(:comment).user).to eq(current_user)
        expect(assigns(:comment).project).to eq(project)
        expect(response).to redirect_to(project)
        expect(flash[:notice]).to eq('Comment added successfully.')
      end
    end

    context 'with invalid params' do
      let(:current_user) { project_member }

      it 'does not create a new comment and redirects with an alert' do
        expect do
          post :create, params: { project_id: project.id, comment: valid_attributes.merge(content: '') }
        end.not_to change(Comment, :count)

        expect(flash[:alert]).to eq('Failed to add comment.')
        expect(response).to redirect_to(project)
      end
    end

    context 'when the user is not a project member' do
      let(:current_user) { non_member }

      it 'does not create a new comment and redirects with an error' do
        expect do
          post :create, params: { project_id: project.id, comment: valid_attributes }
        end.not_to change(Comment, :count)

        expect(response).to redirect_to(project)
        expect(flash[:alert]).to eq('You are not a member of this project and cannot comment.')
      end
    end
  end
end
