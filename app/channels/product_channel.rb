# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.

class ProductChannel < ApplicationCable::Channel
  def subscribed
  	# global product_channel is available on the whole website
    # stream_from "product_channel"

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def listen(data) #argument will contain product id
  	stop_all_streams #default method provided by ActionCable to stop all previous streams
  	stream_for data["product_id"] #stream from a channel that's specific to one of the products
  end
  	
end
