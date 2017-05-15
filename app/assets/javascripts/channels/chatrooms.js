//= require cable
//= require_self
//= require_tree .

this.App = {};

websocket_uri = ->
  prot = if location.protocol == 'https:' then 'wss:' else 'ws:'
  "#{prot}//#{location.host}/_c/"

App.cable = Cable.createConsumer(websocket_uri())