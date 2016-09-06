# in this block we will defiine our first factory and all future factories
FactoryGirl.define do 
	factory :comment do 
		user_id "1"
		body "This is a great sound!"
		rating "5"
		product_id "1"
	end
end