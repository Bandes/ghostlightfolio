import { Controller } from "stimulus"

export default class extends Controller {
  click() {
    $('#details').attr('src', event.target.parentElement.dataset.link);
  }
}
