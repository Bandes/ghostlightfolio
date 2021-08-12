import { Controller } from "stimulus"
import $ from 'jquery'
import DataTable from "datatables"

export default class extends Controller {
  connect() {
    $('table').dataTable( {
      "scrollY": "60vh",
      "scrollCollapse": true,
      "paging": false
    } );
  }
}
