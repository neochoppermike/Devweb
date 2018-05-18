require 'rails_helper'

describe CommentsController, type: :controller do 
	let(:product) {FactoryBot.create(:product)}
  let(:user) {FactoryBot.create(:user)}

  describe 'POST #create' do

    context "comment created succesfully by a loggedin user" do

      before do 
        sign_in user
        @comment = FactoryBot.create(:comment, user: user, product: product)
        product.comments << @comment
      end

      
      it "creates new comment" do 
      expect{
        post :create, params: { comment: FactoryBot.attributes_for(:comment), 
                                user_id: user.id,
                                product_id: product.id}
        }.to change(Comment,:count).by(1)
      end
    end
  end
end      