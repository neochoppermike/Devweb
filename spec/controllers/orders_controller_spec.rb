require 'rails_helper'

describe OrdersController, type: :controller do

  before do
    @user = FactoryBot.create(:user)
  end

  describe 'GET #index' do

    context 'when user signed in' do

      before do
        sign_in @user
      end
      
      it 'loads user order index template' do
      
        get :index
        expect(response).to be_ok
      end
    end 

    context 'when user not signed in' do

      it 'redirects to login' do

        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end     
  end   
end