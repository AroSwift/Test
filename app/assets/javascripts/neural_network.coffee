# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

opts =
  lines: 13
  length: 28
  width: 14
  radius: 42
  scale: 1
  corners: 1
  color: '#000'
  opacity: 0.25
  rotate: 0
  direction: 1
  speed: 1
  trail: 60
  fps: 20
  zIndex: 2e9
  className: 'spinner'
  top: '50%'
  left: '50%'
  shadow: false
  hwaccel: false
  position: 'absolute'
target = document.getElementById('foo')
spinner = new Spinner(opts).spin(target)

spinner = (new Spinner).spin()
target.appendChild spinner.el