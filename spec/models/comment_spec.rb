require 'rails_helper'

describe Comment, :type =>:model do

	it "not valid without valid attributes" do
		expect(Comment.new).not_to be_valid
	end

	it "is not valid without body" do
		comment = Comment.new(body: nil)
		expect(comment).not_to be_valid
	end

	context "belongs to product and user" do
		it {should belong_to(:user)}
		it {should belong_to(:product)}
	end
end
