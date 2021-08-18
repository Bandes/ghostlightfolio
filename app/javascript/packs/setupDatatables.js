import $ from 'jquery'
import DataTable from "datatables"

$(document).on('turbo:before-cache', () => {
  $('.dataTable').DataTable().destroy();
});

$(document).on('turbo:load', () => {
  $('table.hover.stripe').dataTable( {
    "scrollY": "60vh",
    "scrollCollapse": true,
    "paging": false
  } );  
})
