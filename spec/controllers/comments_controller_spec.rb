# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:valid_attributes) { { content: 'This is a comment.' } }

  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new comment and redirects' do
        expect do
          post :create, params: { project_id: project.id, comment: valid_attributes }
        end.to change(Comment, :count).by(1)

        expect(assigns(:comment).user).to eq(user)
        expect(assigns(:comment).project).to eq(project)
        expect(response).to redirect_to(project)
        expect(flash[:notice]).to eq('Comment added successfully.')
      end
    end

    context 'with invalid params' do
      it 'does not create a new comment and redirects with an alert' do
        expect do
          post :create, params: { project_id: project.id, comment: valid_attributes.merge(content: '') }
        end.not_to change(Comment, :count)

        expect(flash[:alert]).to eq('Failed to add comment.')
        expect(response).to redirect_to(project)
      end
    end
  end
end
