# config/initializers/recaptcha.rb
Recaptcha.configure do |config|
  config.public_key  = '6LfaFSgTAAAAAHkbZXfNPpzSvC_tc88GXc6iYfNe'
  config.private_key = '6LfaFSgTAAAAABPJf81_vWoVdTVzWNWDjAAHI-au'
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end