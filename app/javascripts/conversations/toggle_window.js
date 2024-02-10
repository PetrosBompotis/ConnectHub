panel_body.toggle(100, function() {
  var messages_visible = $('ul', this).has('li').length;

  // Load first 10 messages if messages list is empty
  if (!messages_visible && $('.load-more-messages', this).length) {
      $('.load-more-messages', this)[0].click(); 
  }
}); 