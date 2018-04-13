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
end  