// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.

//= require jquery_ujs
//= require main/tooltip
//= require main/markerclusterer
//= require main/handlebars
//= require main/script
//= require select2





// Enable pusher logging - don't include this in production
Pusher.log = function(message) {
  if (window.console && window.console.log) {
    window.console.log(message);
  }
};

var pusher = new Pusher('6294dd503b1fbafeb556', {
  cluster: 'eu',
  encrypted: true
});

var channel = pusher.subscribe('private-1');
channel.bind('new_message', function(data) {
  //alert(data.message);
  console.log(data.message)
});
