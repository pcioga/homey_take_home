# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_attributes) do
    {
      name: 'New Project',
      description: 'Project description',
      user_ids: [user.id]
    }
  end

  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET #index' do
    it 'assigns the user’s projects and renders index' do
      project = create(:project, project_manager: user, users: [user])
      get :index

      expect(assigns(:projects)).to include(project)
    end
  end

  describe 'GET #show' do
    let(:project) { create(:project) }

    it 'assigns the requested project and related data' do
      get :show, params: { id: project.id }

      expect(assigns(:project)).to eq(project)
    end
  end

  describe 'GET #new' do
    it 'assigns a new project and available users' do
      other_user = create(:user)
      get :new

      expect(assigns(:project)).to be_a_new(Project)
      expect(assigns(:users)).to include(other_user)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new project and redirects' do
        expect do
          post :create, params: { project: valid_attributes }
        end.to change(Project, :count).by(1)

        expect(assigns(:project).users).to include(user)
        expect(response).to redirect_to(Project.last)
        expect(flash[:notice]).to eq('Project created successfully.')
      end
    end

    context 'with invalid params' do
      it 'does not create a new project and renders new template' do
        expect do
          post :create, params: { project: valid_attributes.merge(name: '') }
        end.not_to change(Project, :count)

        expect(assigns(:project).errors).not_to be_empty
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
