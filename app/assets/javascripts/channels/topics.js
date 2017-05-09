App.topics = App.cable.subscriptions.create('TopicsChannel', {  
  received: function(data) {
    return $('#topics').append(this.renderTopic(data));
  },

  renderTopic: function(data) {
    return "<h3><a href='/topics/" + data.id + "'>" + data.name + "</a></h3>";
  }

});