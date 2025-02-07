require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user, email: 'test@example.com', password: 'password123') }

    context 'with valid credentials' do
      it 'logs in the user and redirects to root path' do
        post :create, params: { session: { email: user.email, password: 'password123' } }
        expect(session[:user_id]).to eq(user.id)
        expect(response).to redirect_to(authenticated_root_path)
        expect(flash[:notice]).to eq('Logged in successfully!')
      end
    end

    context 'with invalid credentials' do
      it 'renders new template with error message' do
        post :create, params: { session: { email: user.email, password: 'wrong_password' } }
        expect(session[:user_id]).to be_nil
        expect(flash[:error]).to eq('Invalid email or password')
      end
    end
  end

  describe 'DELETE #destroy' do
    before { session[:user_id] = create(:user).id }

    it 'logs out the user and redirects to root path' do
      delete :destroy
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq('Logged out successfully!')
    end
  end
end
