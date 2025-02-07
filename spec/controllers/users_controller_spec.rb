require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    let(:valid_attributes) do
      {
        name: 'Test User',
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      }
    end

    context 'with valid params' do
      it 'creates a new user and redirects' do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)

        expect(session[:user_id]).not_to be_nil
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Account created successfully!')
      end
    end

    context 'with invalid params' do
      it 'does not create a new user and renders new template' do
        expect {
          post :create, params: { user: valid_attributes.merge(email: '') }
        }.not_to change(User, :count)

        expect(controller.instance_variable_get("@user").errors).not_to be_empty
      end
    end
  end
end
