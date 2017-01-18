# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#superior').dataTable(responsive: true)
  $('#inferior').dataTable(responsive: true)
  $('.detalle').dataTable(responsive: true);
