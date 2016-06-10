// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require bootstrap/tooltip
//= require bootstrap/modal
//= require nprogress
//= require nprogress-turbolinks
//= require_tree .


$(document).ready(function() {
  // hide the border around the newly created issue after a little while
  if ($('.issue--new').length > 0) {
    setTimeout(function() {
      $('.issue--new').css('box-shadow', 'none')
    }, 3000)
  }

  if ($('.comment--new').length > 0) {
    setTimeout(function() {
      $('.comment--new').removeClass('comment--new')
    }, 3000)
  }

  // intialize bootstrap tooltips
  $('[data-toggle="tooltip"]').tooltip({html: true})

  // dynamically set form target for the modal when completing an issue
  $('#js-modal-complete-issue').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var issueCompleteURL = button.data('issue-complete-url')
    var modal = $(this)

    // replace the form action URL with data from the button
    modal.find('form').attr('action', issueCompleteURL)
  })
});
