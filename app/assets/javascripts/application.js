// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.

//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require twitter/bootstrap
//= require main/markerclusterer
//= require main/handlebars
//= require main/script
//= require select2
//= require algolia/algoliasearch.min
//= require algolia/typeahead.jquery
//= require hogan




// Enable pusher logging - don't include this in production
// Pusher.log = function(message) {
//   if (window.console && window.console.log) {
//     window.console.log(message);
//   }
// };

// var pusher = new Pusher('6294dd503b1fbafeb556', {
//   cluster: 'eu',
//   encrypted: true
// });

// var channel = pusher.subscribe('private-1');
// channel.bind('new_message', function(data) {
//   //alert(data.message);
//   console.log(data.message)
// });

  $(document).on('click', '#send_message', function() {
    var button = $(this);
    //button.html('...');
    console.log("asdasd")
    var recipient_id =  $("#btn_message").attr('data-recipient_id-id')
    console.log(recipient_id)
    data = $("form#new_message").serialize() + "&recipient_id=" + recipient_id
    console.log(data)
    $.post('/messages.json',data, 
      function(data) {
      console.log("response",data)  
      if (data.success == true) {
        $('#exampleModal').modal('toggle');
        $('.modal-backdrop.in').css({"opacity":0});
      } else {
        $('#exampleModal').modal('toggle');
        $('.modal-backdrop.in').css({"opacity":0});
      }
    });
  });
