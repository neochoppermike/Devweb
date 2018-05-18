require 'rails_helper'


describe Product do
  context "when the product has comments" do
    let(:product) { Product.create!(name: "Cowdy Partner", description: "Great big cow", image_url: "fat_cow.jpg", price: 299 ) }
    let(:user) {User.create!(first_name: "Todd", last_name: "Sampson", email: "todd@yahoo.com", password: "bozobag")}

  	before do
  	  product.comments.create!(rating: 1, user: user, body: "Kinda cow is this anyway?.")
  	  product.comments.create!(rating: 3, user: user, body: "Okay cow, I guess.")
  	  product.comments.create!(rating: 5, user: user, body: "Well this is a first rate cowwww!")
  	end

  	it "returns the average rating of all comments" do
  	  expect(product.average_rating).to eq 3
  	end 

  	it "is not valid without a name" do
        expect(Product.new(description: "Cool cow")).not_to be_valid
  	end

    it "returns the highest rating of all comments" do
  	  expect(product.highest_rating_comment.rating).to eq 5
  	end 

  end

  context "is valid with a name, description and price" do
  	let(:product) {FactoryBot.build(:product)}

  	it "returns valid" do
  	  expect(product).to be_valid	
  	end
  end	

  context "is not valid without a name" do
  	let(:product) {FactoryBot.build(:product, name: nil)}

  	it "returns invalid" do
  	  expect(product).not_to be_valid	
  	end
  end	

  context "is not valid without a price" do
  	let(:product) {FactoryBot.build(:product, price: nil)}

  	it "returns invalid" do
  	  expect(product).not_to be_valid	
  	end
  end	

  context "is not valid without a description" do
  	let(:product) {FactoryBot.build(:product, description: nil)}

  	it "returns invalid" do
  	  expect(product).not_to be_valid	
  	end
  end

  context "search products" do
  	before do
      @product1 = FactoryBot.create(:search_one)
      @product2 = FactoryBot.create(:search_two)
      @product3 = FactoryBot.create(:product)   
    end

    it "returns products that match the search term" do 
        expect(Product.search("cow")).to include(@product1, @product2)
        expect(Product.search("cow")).not_to include(@product3)
    end 
  end

  context "when no match is found" do

      it "returns no products" do 
        expect(Product.search("xxx")).to be_empty
      end
   end
end  

