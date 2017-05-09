App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    $("#messages").removeClass('hidden')
		$('#messages').stop().animate({
				  scrollTop: $('#messages')[0].scrollHeight
				}, 800);
    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
  	$('#chatBox').val('');
		$('#messages').stop().animate({
		  scrollTop: $('#messages')[0].scrollHeight
		}, 800);
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  }

});