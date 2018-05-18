require 'rails_helper'


describe Comment do
  context "when comment is present" do
    let(:product) { Product.create!(name: "Cowdy Partner", description: "Great big cow", image_url: "fat_cow.jpg", price: 299 ) }
    let(:user) {User.create!(first_name: "Todd", last_name: "Sampson", email: "todd@yahoo.com", password: "bozobag")}

	it "is not valid without a user" do
      expect(Comment.new(body: "Cool cow", rating: 2)).not_to be_valid
	end
   
    it "is not valid without a body" do
      expect(Comment.new(user: user, rating: 2)).not_to be_valid
	end

	it "is not valid without a rating" do
      expect(Comment.new(body: "Cool cow", user: user)).not_to be_valid
	end
  end
end  