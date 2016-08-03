class StaticPagesController < ApplicationController
	def index
  end
  def landing_page
  	@products = Product.limit(2)
	end
	def thank_you
		@name=params[:name]
		@email=params[:email]
		@message=params[:message]
		UserMailer.contact_form(@email, @name, @message).deliver_now
		# ActionMailer::Base.mail(:from => @email, 
		# 	:to => 'julia.braune@gmx.net', 
		# 	:subject => "An new message from #{@name}", 
		# 	:body => @message).deliver_now
	end
end
	

