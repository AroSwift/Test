# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Spinner is from:
# http://tobiasahlin.com/spinkit/

$(document).on 'page:fetch', ->
  $('.spinner').show()
  return
$(document).on 'page:receive', ->
  $('.spinner').hide()
  return