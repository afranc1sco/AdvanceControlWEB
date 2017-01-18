# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#clientes-table').dataTable
    responsive: true
    processing: true
    serverSide: true
    ajax: $('#clientes-table').data('source')
    pagingType: 'full_numbers'
    columns: [
        data: "IdCli"
      ,
        data: "Nombre"
    ]
