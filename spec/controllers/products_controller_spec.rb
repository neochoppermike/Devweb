require 'rails_helper'

describe ProductsController, focus: true, type: :controller do
  before do
    @user = FactoryBot.create(:admin)
    sign_in @user
    @product = FactoryBot.create(:product, name: "Cowzaboutit?", description: "Cowee!", price: 500)
  end

  context 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to be_ok
      expect(response).to render_template('new')
    end
  end

  context 'GET #edit' do
    it 'renders the show template' do
      get :edit, params: { id: @product.id }
      expect(response).to be_ok
      expect(response).to render_template('edit')
    end
  end

  context 'GET #show' do
    it 'renders the show template' do
      get :show, params: { id: @product.id }
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

  context 'POST #create' do
    it 'should render the product show page if succesfully created' do
      post :create, params: { product: { name: @product.name, description: @product.description, price: @product.price } }
      expect(response).to be_ok
    end
  end

  context 'PATCH #update' do
    it 'should update the product details' do
      patch :update, params: { id: @product.id, product: { description: "new description" } }
      @product.reload
      expect(@product.description).to eq "new description"
    end
  end

  context 'DELETE #destroy' do
    it 'should delete the product and redirect to products' do
      delete :destroy, params: { id: @product.id, product: @product }
      expect(response).to redirect_to products_path
    end
  end
end