App.topics = App.cable.subscriptions.create('TopicsChannel', {  
  received: function(data) {
    return $('#topics').append(this.renderTopic(data));
  },

  renderTopic: function(data) {
    return  "<tr><td><a href='/topics/" + data.id + "'>" + data.name + '</a></td><td>' + data.user + '</td><td>' + data.time + '</td></tr>';
  }

});