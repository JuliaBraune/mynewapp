# in this block we will defiine our first factory and all future factories
FactoryGirl.define do 
	sequence(:email) {|n| "user#{n}@example.com"} #sequence generates sample email addresses 
	factory :user do # short for factory :user, class: User do
		# email "jube@gmx.de"
		email # because of sequence
		password "12345678"
		first_name "Julia"
		last_name "Braune"
		admin false
	end
	
	factory :admin, class: User do
		# email "julia@gmx.de"
		email # because of sequence
		password "asdfasdf"
		first_name "J"
		last_name "B"
		admin true	
	end
end