#no factories outside of this block!
FactoryBot.define do

  factory :product do
  	name "Red"
  	description "Big one!"
  	image_url "assets/img.jpg"
  	price 255
  end	

  factory :search_one, class: Product do
  	name "First cow"
  	description "This is the first cow"
  	image_url "assets/img1.jpg"
  	price 250
  end
  
  factory :search_two, class: Product do
  	name "Second cow"
  	description "This is the second cow"
  	image_url "assets/img2.jpg"
  	price 2500
  end	
end