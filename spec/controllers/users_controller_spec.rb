require 'rails_helper'



describe UsersController, type: :controller do
  let(:user) {User.create!(first_name: "Todd", last_name: "Sampson", email: "todd@yahoo.com", password: "bozobag")}
  let(:user2) {User.create!(first_name: "Biff", last_name: "Simpson", email: "biff@yahoo.com", password: "yopeyo")}


  describe 'GET #show' do
    context 'when a user is logged in' do

      before do
      	sign_in user
      end  	

      it 'loads correct user details' do
        get :show, params: {id: user.id}
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end 
    end

    context 'when a user is not logged in' do
      it 'redirects to root' do
        get :show, params: {id: user.id}
        expect(response).to redirect_to(root_path)
      end    
    end
  
    context 'when user1 is signed in' do

      before do
        sign_in user
      end

      it 'cannot access user2 data' do
        get :show, params: {id: user2.id}
        expect(response).to redirect_to(root_path)
      end  
    end  
  
    context 'when user1 attempts to access user2 data' do
      
      before do
        sign_in user
      end

      it 'reports UNAUTHORIZED (HTTP status 401)' do
        get :show, params: {id: user2.id}
        expect(response).to have_http_status(401)
      end  
    end
  end 
end     