require "rails_helper"

describe User do
  
  context "is valid with a first name, last name, email and password" do
    let(:user) {FactoryBot.build(:user)}
    it "returns valid" do
      expect(user).to be_valid
    end  
  end   	

  context "is valid with only an email and password" do
    let(:user) {FactoryBot.build(:user, first_name: nil, last_name: nil)}
	  it "returns valid" do
	    expect(user).to be_valid
	  end
	end  

  context "is not valid without an email" do
	  let(:user) {FactoryBot.build(:user, email: nil)}
	  it "returns invalid" do
	    expect(user).to_not be_valid
	  end
  end

  context "is not valid without a password" do 
	  let(:user) {FactoryBot.build(:user, password: nil)}
	  it "returns invalid" do
	    expect(user).to_not be_valid
	  end
	end 
end