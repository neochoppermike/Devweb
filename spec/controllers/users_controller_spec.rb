require 'rails_helper'



describe UsersController, type: :controller do
  #let(:user) {User.create!(first_name: "Todd", last_name: "Sampson", email: "todd@yahoo.com", password: "bozobag")}
  #let(:user2) {User.create!(first_name: "Biff", last_name: "Simpson", email: "biff@yahoo.com", password: "yopeyo")}
    
    before do
      @user = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      @user3 = FactoryBot.create(:admin)
    end  

  describe 'GET #show' do
    context 'when a user is logged in' do

      before do
      	sign_in @user
      end  	

      it 'loads correct user details' do
        get :show, params: {id: @user.id}
        expect(response).to be_ok
        expect(assigns(:user)).to eq @user
      end 
    end

    context 'when a user is not logged in' do
      it 'redirects to root' do
        get :show, params: {id: @user.id}
        expect(response).to redirect_to(new_user_session_path)
      end    
    end
  
    context 'when user1 is signed in' do

      before do
        sign_in @user
      end

      it 'cannot access user2 data' do
        get :show, params: {id: @user2.id}
        expect(response).to redirect_to(root_path)
      end  
    end  
  
    context 'when user1 attempts to access user2 data' do
      
      before do
        sign_in @user
      end

      it 'redirects to root path ("redirection found" = HTTP status 302)' do
        get :show, params: {id: @user2.id}
        expect(response).to have_http_status(302)
      end  
    end

    context 'when admin attempts to access user2 data' do
      
      before do
        sign_in @user3
      end

      it 'can access' do
        get :show, params: {id: @user2.id}
        expect(response).to be_ok
      end  
    end
  end 

  describe 'GET #index' do

    context 'when user is admin' do
      
      before do
        sign_in @user3
      end  
      
      it 'renders index template' do
        get :index
        expect(response).to be_ok
      end
    end 

    context 'when user is not admin' do
      
      before do
        sign_in @user
      end  
      
      it 'redirect to login' do
        get :index
        expect(response).to have_http_status(302)
      end
    end  
  end

  describe 'GET #new' do

    context 'when user is logged in' do
      
      before do
        sign_in @user
      end  
    
      it 'redirects to new user page' do
        get :new
        expect(response).to be_ok
      end
    end  
  end
end