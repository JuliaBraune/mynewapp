require 'rails_helper'

describe Product do 
	context "when the product has comments" do
		before do # here you put your code to generate test content
			@product = Product.create!(name: "testvinyl")
			@user = User.create!(email: "jul@gmx.de", password: "asdfghjkl")
			@product.comments.create!(rating: 5, user: @user, body: "really cool")
			@product.comments.create!(rating: 1, user: @user, body: "bah...")
			@product.comments.create!(rating: 3, user: @user, body: "okay")
		end
		it "returns the average rating of all comments" do # what we want to happen
			expect(@product.average_rating).to eq 3
		end
		it "not valid" do # make sure that our validations work properly
			expect(Product.new(description: "nice vinyl")).not_to be_valid # a product without a name
		end
	end
end