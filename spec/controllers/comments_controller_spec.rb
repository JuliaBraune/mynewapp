require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
	before do
		@product = FactoryGirl.create(:product)
		@comment = FactoryGirl.build(:comment).attributes
	end

	context "with valid params" do
		before do
			@current_user = FactoryGirl.create(:user)
			sign_in @current_user
		end

		it "creates a new comment" do
			expect {
				post :create, params: {product_id: @product.id, comment: @comment}
			}.to change(Comment, :count).by(1)
		end

		context "delete comment" do
			before do
				@current_user = FactoryGirl.create(:user)
				@created_comment = FactoryGirl.create(:comment)
				sign_in @current_user
			end

			it "delete" do
				expect {
					delete :destroy, params: {product_id: @product.id, id: @created_comment.id}
				}.to change(Comment, :count).by(-1)
			end
		end
	end
end
