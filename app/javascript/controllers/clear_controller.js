import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clear"
export default class extends Controller {
  static targets = ["form"]

  refresh() {
    window.location.href = '/';

  }
}
