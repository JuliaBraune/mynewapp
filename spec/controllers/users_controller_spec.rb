require 'rails_helper'

describe UsersController, :type => :controller do # functional test file for users_controller.rb
	before do
		# @user = User.create!(email: "jul.br@gmx.net", password: "asdfghjkl") # wird ersetzt durch FactoryGirl
		@user = FactoryGirl.create(:user)
		@second_user = User.create!(email: "j-b@gmx.de", password: "1234567")

	end


	describe "GET #show" do # everything inside this block will happen in the show action
		context "User is logged in" do
			before do
				sign_in @user
			end

			it "loads correct user details" do
				get :show, params: {id: @user.id}
				expect(response).to have_http_status (200)
				expect(assigns(:user)).to eq @user
			end

			it "redirects to HTTP 302 status code" do
				get :show, params: {id:@second_user.id}
				expect(response).to have_http_status(302)
				expect(assigns(:user)).to eq @second_user
			end				
		end

		context "No user is logged in" do
			it "redirects to login" do
				get :show, params: {id: @user.id}  # a show page always needs an ID; here we define the ID to be equal the ID of the user
				expect(response).to redirect_to(root_path)
			end
		end

		context "User cannot access the show-page of the second_user" do
			it "redirects to login" do
				get :show, params: {id: @second_user.id}
				expect(response).to redirect_to(root_path)
			end
		end

	end

end