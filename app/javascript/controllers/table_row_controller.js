import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    const row = document.getElementById(this.element.dataset.highlightedRow);
    if(row !== null) {
      row.classList.add('active');
      row.scrollIntoView();
    }
  }

  click() {
    $('#details').attr('src', event.target.parentElement.dataset.link);
    $('tr').removeClass('active');
    $(event.target.parentElement).addClass('active');
  }
}
