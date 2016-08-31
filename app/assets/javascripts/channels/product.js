App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
  	$(".alert.alert-info").show();
    $('.product-reviews').prepend(data.comment);
    refreshRating();
  },

  listen_to_comments: function() {
    // to call listen method on client-side in product_channel.rb
    return this.perform('listen', {
      product_id: $("[data-product-id]").data("product-id")
    });
  }
});

// calls the listen_to_comments() method 
// will make sure listen_to_comments() is called every single time the user loads a new page
$(document).on('turbolinks:load', function() {
  App.product.listen_to_comments();

});
