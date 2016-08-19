class PaymentsController < ApplicationController
	before_filter :authenticate_user!

	# Get the credit card details submitted by the form
	def create
		@product = Product.find(params[:product_id])
		@user = current_user
		token = params[:stripeToken]
		# Create a charge: this will charge the user's card
		begin
		  charge = Stripe::Charge.create(
		    :amount => @product.price*100, # Amount in cents
		    :currency => "eur",
		    :source => token,
		    :description => params[:stripeEmail]
		  )

		  if charge.paid
		  	Order.create(
		  		:product_id => @product_id,
		  		:user_id => @user_id,
		  		:total => @product.price)
		  end
  	flash[:success] = "Payment processed successfully"

		rescue Stripe::CardError => e
		  # The card has been declined
    	body = e.json_body
    	err = body[:error]
    	flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
  
		redirect_to product_path(@product)

	end
end
