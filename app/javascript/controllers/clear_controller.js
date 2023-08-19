import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clear"
export default class extends Controller {

  refresh() {
    window.location.href = '/';
  }
}
