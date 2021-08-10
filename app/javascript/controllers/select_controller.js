import { Controller } from "stimulus"
import $ from 'jquery'
import Select2 from "select2"

export default class extends Controller {
  connect() {
    $('select').select2();
  }
}
