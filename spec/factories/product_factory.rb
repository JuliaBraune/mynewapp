# in this block we will defiine our first factory and all future factories
FactoryGirl.define do 
	factory :product do 
		name "Vinyl-Test 2"
		description "The second release of Polycarp Records"
		image_url "www.spon.de"
		price "30"
	end
end