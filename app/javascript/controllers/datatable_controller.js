import { Controller } from "stimulus"
import $ from 'jquery'
import DataTable from "datatables"

export default class extends Controller {
  connect() {
    $('table').DataTable();
  }
}
