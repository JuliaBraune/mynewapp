if Rails.env.production?
	Rails.configuration.stripe = {
		:publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
		:secret_key => ENV['STRIPE_SECRET_KEY']
	}
else
	Rails.configuration.stripe = {
		:publishable_key => 'pk_test_F5TANLOtpI9QRwPmueOq1Lir',
		:secret_key => 'sk_test_DJJm0GEeTj4lshvb1IKdiPDX'
	}
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

