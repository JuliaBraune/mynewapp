#test to make sure the validation of email addresses works properly
require 'rails_helper'

describe User, :type => :model do
	it "should not validate users without an email address" do
		#we use "build" because if we would use "create" the test would fail because a user cannot be created without a valid email address
		@user = FactoryGirl.build(:user, email: "not_an_email")
		expect(@user).to_not be_valid
	end	
end
