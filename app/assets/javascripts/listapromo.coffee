# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#listapromo').dataTable(responsive: true)
  $('#promociones_regalo').dataTable({ "order": [[ 5, "asc" ]], responsive: true })
