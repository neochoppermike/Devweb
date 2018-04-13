require 'rails_helper'


describe Comment do
  context "when comment is present" do
    let(:product) { Product.create!(name: "Cowdy Partner", description: "Great big cow", image_url: "fat_cow.jpg", price: 299 ) }
    let(:user) {User.create!(first_name: "Todd", last_name: "Sampson", email: "todd@yahoo.com", password: "bozobag")}

	before do
	  product.comments.create!(rating: 1, user: user, body: "Kinda cow is this anyway?.")
	  product.comments.create!(rating: 3, user: user, body: "Okay cow, I guess.")
	  product.comments.create!(rating: 5, user: user, body: "Well this is a first rate cowwww!")
	end

	it "is not valid without a user" do
      expect(Comment.new(body: "Cool cow", rating: 2, product_id: 1)).not_to be_valid
	end

  end
end  